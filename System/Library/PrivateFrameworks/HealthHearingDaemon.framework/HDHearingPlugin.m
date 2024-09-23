@implementation HDHearingPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BE45688];
}

- (NSString)schemaName
{
  return (NSString *)CFSTR("hearing");
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[HDHearingPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentSchemaVersion");

  return v4;
}

- (id)_databaseSchemaForProtectionClass:(int64_t)a3
{
  __objc2_class **v3;

  if (a3 == 1)
  {
    v3 = &off_24DC5E940;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    v3 = off_24DC5E938;
LABEL_5:
    self = (HDHearingPlugin *)objc_alloc_init(*v3);
  }
  return self;
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRealityDevice");

  return v4 ^ 1;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDHearingProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDHearingProfileExtension initWithProfile:]([HDHearingProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)taskServerClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)CFSTR("com.apple.healthd.hearing.sync-schema");
}

- (id)orderedSyncEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HDHearingPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HDHearingPlugin _databaseSchemaForProtectionClass:](self, "_databaseSchemaForProtectionClass:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HDHearingPlugin schemaName](self, "schemaName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerMigrationStepsForSchemaName:migrator:", v7, v6);

}

@end
