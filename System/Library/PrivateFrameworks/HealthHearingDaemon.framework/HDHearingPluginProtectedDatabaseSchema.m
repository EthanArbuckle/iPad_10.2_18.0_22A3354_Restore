@implementation HDHearingPluginProtectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

@end
