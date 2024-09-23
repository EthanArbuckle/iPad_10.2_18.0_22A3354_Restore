@implementation HDHeartPluginUnprotectedDatabaseSchema

- (int64_t)currentSchemaVersion
{
  return 0;
}

- (NSArray)databaseEntities
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

@end
