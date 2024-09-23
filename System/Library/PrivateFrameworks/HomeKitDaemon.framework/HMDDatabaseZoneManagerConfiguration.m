@implementation HMDDatabaseZoneManagerConfiguration

- (HMDDatabaseZoneManagerConfiguration)init
{
  HMDDatabaseZoneManagerConfiguration *v2;
  HMDDatabaseZoneManagerConfiguration *v3;
  uint64_t v4;
  NSSet *externalRecordTypesForSubscriptions;
  HMDHomeKitVersion *v6;
  HMDHomeKitVersion *minimumHomeKitVersion;
  uint64_t v8;
  NSSet *requiredSupportedFeatures;
  HMBCloudZoneConfiguration *v10;
  HMBCloudZoneConfiguration *cloudZoneConfiguration;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDDatabaseZoneManagerConfiguration;
  v2 = -[HMDDatabaseZoneManagerConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldCreateZone = 1;
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    externalRecordTypesForSubscriptions = v3->_externalRecordTypesForSubscriptions;
    v3->_externalRecordTypesForSubscriptions = (NSSet *)v4;

    v6 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("6.0"));
    minimumHomeKitVersion = v3->_minimumHomeKitVersion;
    v3->_minimumHomeKitVersion = v6;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    requiredSupportedFeatures = v3->_requiredSupportedFeatures;
    v3->_requiredSupportedFeatures = (NSSet *)v8;

    v10 = (HMBCloudZoneConfiguration *)objc_alloc_init(MEMORY[0x24BE4EC68]);
    cloudZoneConfiguration = v3->_cloudZoneConfiguration;
    v3->_cloudZoneConfiguration = v10;

  }
  return v3;
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Zone Owner"), v24);
  v25[0] = v23;
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Should Create Zone"), v22);
  v25[1] = v21;
  v5 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDatabaseZoneManagerConfiguration externalRecordTypesForSubscriptions](self, "externalRecordTypesForSubscriptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("External Record Types"), v20);
  v25[2] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDatabaseZoneManagerConfiguration minimumHomeKitVersion](self, "minimumHomeKitVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Minumum HomeKit Version"), v8);
  v25[3] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDatabaseZoneManagerConfiguration requiredSupportedFeatures](self, "requiredSupportedFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Required Supported Features"), v13);
  v25[4] = v14;
  v15 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDDatabaseZoneManagerConfiguration cloudZoneConfiguration](self, "cloudZoneConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Cloud Zone Configuration"), v16);
  v25[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  char v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner"),
        v7 == objc_msgSend(v6, "isZoneOwner"))
    && (v8 = -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone"),
        v8 == objc_msgSend(v6, "shouldCreateZone")))
  {
    -[HMDDatabaseZoneManagerConfiguration externalRecordTypesForSubscriptions](self, "externalRecordTypesForSubscriptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalRecordTypesForSubscriptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToSet:", v12))
    {
      -[HMDDatabaseZoneManagerConfiguration minimumHomeKitVersion](self, "minimumHomeKitVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimumHomeKitVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToVersion:", v14))
      {
        -[HMDDatabaseZoneManagerConfiguration requiredSupportedFeatures](self, "requiredSupportedFeatures");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "requiredSupportedFeatures");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToSet:", v16))
        {
          -[HMDDatabaseZoneManagerConfiguration cloudZoneConfiguration](self, "cloudZoneConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "cloudZoneConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v18, "isEqual:", v17);

        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  v3 = -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner");
  v4 = v3 ^ -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone");
  -[HMDDatabaseZoneManagerConfiguration externalRecordTypesForSubscriptions](self, "externalRecordTypesForSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[HMDDatabaseZoneManagerConfiguration minimumHomeKitVersion](self, "minimumHomeKitVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  -[HMDDatabaseZoneManagerConfiguration requiredSupportedFeatures](self, "requiredSupportedFeatures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash") ^ v4;

  -[HMDDatabaseZoneManagerConfiguration cloudZoneConfiguration](self, "cloudZoneConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableDatabaseZoneManagerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[HMDDatabaseZoneManagerConfiguration init](+[HMDMutableDatabaseZoneManagerConfiguration allocWithZone:](HMDMutableDatabaseZoneManagerConfiguration, "allocWithZone:", a3), "init");
  -[HMDDatabaseZoneManagerConfiguration setZoneOwner:](v4, "setZoneOwner:", -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner"));
  -[HMDDatabaseZoneManagerConfiguration setShouldCreateZone:](v4, "setShouldCreateZone:", -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone"));
  -[HMDDatabaseZoneManagerConfiguration externalRecordTypesForSubscriptions](self, "externalRecordTypesForSubscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setExternalRecordTypesForSubscriptions:](v4, "setExternalRecordTypesForSubscriptions:", v5);

  -[HMDDatabaseZoneManagerConfiguration minimumHomeKitVersion](self, "minimumHomeKitVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setMinimumHomeKitVersion:](v4, "setMinimumHomeKitVersion:", v6);

  -[HMDDatabaseZoneManagerConfiguration requiredSupportedFeatures](self, "requiredSupportedFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setRequiredSupportedFeatures:](v4, "setRequiredSupportedFeatures:", v7);

  -[HMDDatabaseZoneManagerConfiguration cloudZoneConfiguration](self, "cloudZoneConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDatabaseZoneManagerConfiguration setCloudZoneConfiguration:](v4, "setCloudZoneConfiguration:", v8);

  return v4;
}

- (BOOL)isZoneOwner
{
  return self->_zoneOwner;
}

- (void)setZoneOwner:(BOOL)a3
{
  self->_zoneOwner = a3;
}

- (BOOL)shouldCreateZone
{
  return self->_shouldCreateZone;
}

- (void)setShouldCreateZone:(BOOL)a3
{
  self->_shouldCreateZone = a3;
}

- (NSSet)externalRecordTypesForSubscriptions
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExternalRecordTypesForSubscriptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (HMDHomeKitVersion)minimumHomeKitVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMinimumHomeKitVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSSet)requiredSupportedFeatures
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequiredSupportedFeatures:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (HMBCloudZoneConfiguration)cloudZoneConfiguration
{
  return (HMBCloudZoneConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudZoneConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudZoneConfiguration, 0);
  objc_storeStrong((id *)&self->_requiredSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersion, 0);
  objc_storeStrong((id *)&self->_externalRecordTypesForSubscriptions, 0);
}

@end
