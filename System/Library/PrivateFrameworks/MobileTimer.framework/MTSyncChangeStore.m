@implementation MTSyncChangeStore

+ (id)persistentStoreForDataModel:(id)a3
{
  id v3;
  MTPersistentSyncChangeStore *v4;

  v3 = a3;
  v4 = -[MTPersistentSyncChangeStore initWithDataModel:]([MTPersistentSyncChangeStore alloc], "initWithDataModel:", v3);

  return v4;
}

+ (id)inMemoryStore
{
  return (id)objc_opt_new();
}

@end
