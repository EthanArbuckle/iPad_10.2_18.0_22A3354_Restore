@implementation HDHealthMedicationsPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D2C4F0], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "medicationsFutureMigrationsEnabled");

  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

@end
