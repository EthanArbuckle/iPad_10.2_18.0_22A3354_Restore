@implementation HDDeviceContext

+ (id)localProductTypeEnumWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0CB59E0]) & 1) != 0)
  {
    v5 = 0;
LABEL_9:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0CB59D8]) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0CB59F0]) & 1) != 0)
  {
    v5 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v4, "hasPrefix:", *MEMORY[0x1E0CB59E8]) & 1) != 0)
  {
    v5 = 3;
    goto LABEL_9;
  }
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB52C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Device of type %@ is not supported", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Device of type is not supported"));
  return 0;
}

- (id)initForLocalDeviceWithType:(int64_t)a3 syncIdentity:(id)a4
{
  id v7;
  HDDeviceContext *v8;
  HDDeviceContext *v9;
  uint64_t v10;
  NSDate *modificationDate;
  uint64_t v12;
  NSString *productTypeName;
  uint64_t v14;
  NSString *currentOSName;
  __int128 v17;
  int64_t v18;
  objc_super v19;

  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDDeviceContext;
  v8 = -[HDDeviceContext init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = objc_claimAutoreleasedReturnValue();
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v10;

    objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceProductType");
    v12 = objc_claimAutoreleasedReturnValue();
    productTypeName = v9->_productTypeName;
    v9->_productTypeName = (NSString *)v12;

    objc_msgSend(MEMORY[0x1E0CB6F18], "currentOSName");
    v14 = objc_claimAutoreleasedReturnValue();
    currentOSName = v9->_currentOSName;
    v9->_currentOSName = (NSString *)v14;

    objc_msgSend(MEMORY[0x1E0CB6F18], "currentOSVersionStruct");
    *(_OWORD *)&v9->_currentOSVersion.majorVersion = v17;
    v9->_currentOSVersion.patchVersion = v18;
    objc_storeStrong((id *)&v9->_syncIdentity, a4);
  }

  return v9;
}

- (HDDeviceContext)initWithType:(int64_t)a3 productTypeName:(id)a4 currentOSName:(id)a5 currentOSVersion:(id *)a6 modificationDate:(id)a7 syncIdentity:(id)a8
{
  id v15;
  id v16;
  id v17;
  HDDeviceContext *v18;
  HDDeviceContext *v19;
  __int128 v20;
  id v22;
  objc_super v23;

  v22 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HDDeviceContext;
  v18 = -[HDDeviceContext init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_modificationDate, a7);
    objc_storeStrong((id *)&v19->_productTypeName, a4);
    objc_storeStrong((id *)&v19->_currentOSName, a5);
    v20 = *(_OWORD *)&a6->var0;
    v19->_currentOSVersion.patchVersion = a6->var2;
    *(_OWORD *)&v19->_currentOSVersion.majorVersion = v20;
    objc_storeStrong((id *)&v19->_syncIdentity, a8);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDDeviceContext *v4;
  NSString *productTypeName;
  NSString *currentOSName;
  int64_t type;
  NSDate *modificationDate;
  HDSyncIdentity *syncIdentity;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  v4 = +[HDDeviceContext allocWithZone:](HDDeviceContext, "allocWithZone:", a3);
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  type = self->_type;
  modificationDate = self->_modificationDate;
  syncIdentity = self->_syncIdentity;
  currentOSVersion = self->_currentOSVersion;
  return -[HDDeviceContext initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:](v4, "initWithType:productTypeName:currentOSName:currentOSVersion:modificationDate:syncIdentity:", type, productTypeName, currentOSName, &currentOSVersion, modificationDate, syncIdentity);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HDDeviceContext *v6;
  HDDeviceContext *v7;
  int64_t type;
  NSString *productTypeName;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  char v13;
  NSString *currentOSName;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  void *v18;
  HDSyncIdentity *syncIdentity;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;

  v6 = (HDDeviceContext *)a3;
  if (self == v6)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      type = self->_type;
      if (type != -[HDDeviceContext type](v7, "type"))
      {
        v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
      productTypeName = self->_productTypeName;
      -[HDDeviceContext productTypeName](v7, "productTypeName");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (productTypeName != v10)
      {
        -[HDDeviceContext productTypeName](v7, "productTypeName");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v13 = 0;
          goto LABEL_30;
        }
        v3 = (void *)v11;
        v12 = self->_productTypeName;
        -[HDDeviceContext productTypeName](v7, "productTypeName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4))
        {

          v13 = 0;
LABEL_29:

          goto LABEL_30;
        }
        v24 = v4;
      }
      currentOSName = self->_currentOSName;
      -[HDDeviceContext currentOSName](v7, "currentOSName");
      v15 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (currentOSName != v15)
      {
        -[HDDeviceContext currentOSName](v7, "currentOSName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_24;
        v4 = (void *)v16;
        v17 = self->_currentOSName;
        -[HDDeviceContext currentOSName](v7, "currentOSName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!-[NSString isEqualToString:](v17, "isEqualToString:"))
        {
          v13 = 0;
          v18 = v24;
LABEL_21:

          goto LABEL_27;
        }
      }
      if (v7)
        -[HDDeviceContext currentOSVersion](v7, "currentOSVersion");
      if ((HKNSOperatingSystemVersionsEqual() & 1) != 0)
      {
        syncIdentity = self->_syncIdentity;
        -[HDDeviceContext syncIdentity](v7, "syncIdentity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HDSyncIdentity isEqual:](syncIdentity, "isEqual:", v20);

        v21 = currentOSName == v15;
        v18 = v24;
        if (v21)
          goto LABEL_27;
        goto LABEL_21;
      }
      if (currentOSName == v15)
      {
        v13 = 0;
        v18 = v24;
LABEL_27:

        if (productTypeName != v10)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_24:
      v13 = 0;
      v18 = v24;
      if (productTypeName == v10)
        goto LABEL_30;
      goto LABEL_28;
    }
    v13 = 0;
  }
LABEL_32:

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t type;
  NSString *productTypeName;
  NSString *currentOSName;
  void *v8;
  void *v9;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  type = self->_type;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  currentOSVersion = self->_currentOSVersion;
  HKNSOperatingSystemVersionString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p type:%ld productType:%@ OSName:%@ OSVersion:%@ sync identity:%@ last modified:%@ "), v4, self, type, productTypeName, currentOSName, v8, self->_syncIdentity, self->_modificationDate, *(_OWORD *)&currentOSVersion.majorVersion, currentOSVersion.patchVersion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeviceContext)initWithCoder:(id)a3
{
  id v4;
  HDDeviceContext *v5;
  uint64_t v6;
  NSString *productTypeName;
  uint64_t v8;
  NSString *currentOSName;
  void *v10;
  uint64_t v11;
  NSDate *modificationDate;
  uint64_t v13;
  HDSyncIdentity *syncIdentity;
  __int128 v16;
  int64_t v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDDeviceContext;
  v5 = -[HDDeviceContext init](&v18, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ProductType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductTypeName"));
    v6 = objc_claimAutoreleasedReturnValue();
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOSName"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentOSName = v5->_currentOSName;
    v5->_currentOSName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CurrentOSVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKNSOperatingSystemVersionFromString();
    *(_OWORD *)&v5->_currentOSVersion.majorVersion = v16;
    v5->_currentOSVersion.patchVersion = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SyncIdentity"));
    v13 = objc_claimAutoreleasedReturnValue();
    syncIdentity = v5->_syncIdentity;
    v5->_syncIdentity = (HDSyncIdentity *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;
  void *v6;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", type, CFSTR("ProductType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productTypeName, CFSTR("ProductTypeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentOSName, CFSTR("CurrentOSName"));
  currentOSVersion = self->_currentOSVersion;
  HKNSOperatingSystemVersionString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("CurrentOSVersion"), *(_OWORD *)&currentOSVersion.majorVersion, currentOSVersion.patchVersion);

  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncIdentity, CFSTR("SyncIdentity"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (NSString)currentOSName
{
  return self->_currentOSName;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end
