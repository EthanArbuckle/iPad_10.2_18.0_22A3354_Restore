@implementation ACHAwardsPlugin

- (ACHAwardsPlugin)init
{
  ACHAwardsPlugin *v2;
  HDDatabaseSchemaProvider *v3;
  HDDatabaseSchemaProvider *schemaProvider;
  ACHMobileAssetProvider *v5;
  ACHMobileAssetProvider *mobileAssetProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACHAwardsPlugin;
  v2 = -[ACHAwardsPlugin init](&v8, sel_init);
  if (v2)
  {
    v3 = (HDDatabaseSchemaProvider *)objc_alloc_init(MEMORY[0x24BE01A20]);
    schemaProvider = v2->_schemaProvider;
    v2->_schemaProvider = v3;

    v5 = (ACHMobileAssetProvider *)objc_alloc_init(MEMORY[0x24BE01A60]);
    mobileAssetProvider = v2->_mobileAssetProvider;
    v2->_mobileAssetProvider = v5;

  }
  return v2;
}

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE01420];
}

- (id)extensionForHealthDaemon:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BE01998];
  v5 = a3;
  v6 = [v4 alloc];
  -[ACHAwardsPlugin mobileAssetProvider](self, "mobileAssetProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDaemon:mobileAssetProvider:", v5, v7);

  return v8;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  ACHAwardsProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[ACHAwardsProfileExtension initWithProfile:]([ACHAwardsProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)taskServerClasses
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)schemaName
{
  void *v2;
  void *v3;

  -[ACHAwardsPlugin schemaProvider](self, "schemaProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "schemaName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[ACHAwardsPlugin schemaProvider](self, "schemaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentSchemaVersionForProtectionClass:", a3);

  return v5;
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v4;
  void *v5;

  -[ACHAwardsPlugin schemaProvider](self, "schemaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "databaseEntitiesForProtectionClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[ACHAwardsPlugin schemaProvider](self, "schemaProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerMigrationStepsForProtectionClass:migrator:", a3, v6);

}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE01558];
}

- (id)orderedSyncEntities
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDDatabaseSchemaProvider)schemaProvider
{
  return self->_schemaProvider;
}

- (void)setSchemaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_schemaProvider, a3);
}

- (ACHMobileAssetProvider)mobileAssetProvider
{
  return self->_mobileAssetProvider;
}

- (void)setMobileAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_schemaProvider, 0);
}

@end
