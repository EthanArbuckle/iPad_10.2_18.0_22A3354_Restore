@implementation FCAudioPlaylistMigrator

- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4
{
  return a4 > 2;
}

- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6
{
  return a4;
}

@end
