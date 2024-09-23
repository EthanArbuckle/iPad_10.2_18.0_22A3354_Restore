@implementation HDRacePreviousRoutePlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.RacePreviousRoute");
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)extensionForProfile:(id)a3
{
  id v3;
  HDRacePreviousRouteProfileExtension *v4;

  v3 = a3;
  if (objc_msgSend(v3, "profileType") == 1)
    v4 = -[HDRacePreviousRouteProfileExtension initWithProfile:]([HDRacePreviousRouteProfileExtension alloc], "initWithProfile:", v3);
  else
    v4 = 0;

  return v4;
}

- (NSString)schemaName
{
  return (NSString *)CFSTR("RacePreviousRoute");
}

- (int64_t)currentSchemaVersionForProtectionClass:(int64_t)a3
{
  return +[HDRacePreviousRouteSchemaProvider currentSchemaVersionForProtectionClass:](HDRacePreviousRouteSchemaProvider, "currentSchemaVersionForProtectionClass:", a3);
}

- (id)databaseEntitiesForProtectionClass:(int64_t)a3
{
  return +[HDRacePreviousRouteSchemaProvider databaseEntitiesForProtectionClass:](HDRacePreviousRouteSchemaProvider, "databaseEntitiesForProtectionClass:", a3);
}

- (void)registerMigrationStepsForProtectionClass:(int64_t)a3 migrator:(id)a4
{
  +[HDRacePreviousRouteSchemaProvider registerMigrationStepsForProtectionClass:migrator:](HDRacePreviousRouteSchemaProvider, "registerMigrationStepsForProtectionClass:migrator:", a3, a4);
}

- (NSString)syncSchemaIdentifier
{
  return (NSString *)CFSTR("com.apple.health.RacePreviousRoute.sync");
}

- (id)orderedSyncEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskServerClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
