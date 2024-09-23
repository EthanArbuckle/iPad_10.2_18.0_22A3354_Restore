@implementation ACHAchievementsPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE01550];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  return ACHShouldUseNewAwardsSystem() ^ 1;
}

- (ACHAchievementsPlugin)init
{
  ACHAchievementsPlugin *v2;
  HDDatabaseSchemaProvider *v3;
  HDDatabaseSchemaProvider *schemaProvider;
  ACHMobileAssetProvider *v5;
  ACHMobileAssetProvider *mobileAssetProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACHAchievementsPlugin;
  v2 = -[ACHAchievementsPlugin init](&v8, sel_init);
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

- (id)extensionForHealthDaemon:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BE01998];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDaemon:mobileAssetProvider:", v5, self->_mobileAssetProvider);

  return v6;
}

- (id)extensionForProfile:(id)a3
{
  id v4;
  ACHAchievementsProfileExtension *v5;
  ACHAchievementsProfileExtension *v6;

  v4 = a3;
  if (objc_msgSend(v4, "profileType") == 1)
  {
    v5 = [ACHAchievementsProfileExtension alloc];
    v6 = -[ACHAchievementsProfileExtension initWithProfile:mobileAssetProvider:unitTesting:](v5, "initWithProfile:mobileAssetProvider:unitTesting:", v4, self->_mobileAssetProvider, *MEMORY[0x24BE40D20] != 0);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)schemaName
{
  return (NSString *)MEMORY[0x24BEDD108](self->_schemaProvider, sel_schemaName);
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return MEMORY[0x24BEDD108](self->_schemaProvider, sel_currentSchemaVersionForProtectionClass_);
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  return (id)MEMORY[0x24BEDD108](self->_schemaProvider, sel_databaseEntitiesForProtectionClass_);
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  MEMORY[0x24BEDD108](self->_schemaProvider, sel_registerMigrationStepsForProtectionClass_migrator_);
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

- (id)taskServerClasses
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetProvider, 0);
  objc_storeStrong((id *)&self->_schemaProvider, 0);
}

@end
