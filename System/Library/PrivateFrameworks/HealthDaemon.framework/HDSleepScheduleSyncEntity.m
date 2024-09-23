@implementation HDSleepScheduleSyncEntity

+ (int)nanoSyncObjectType
{
  return 48;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 52);
}

+ (Class)healthEntityClass
{
  return (Class)objc_opt_class();
}

+ (Class)_syncedSampleTypeClass
{
  return (Class)objc_opt_class();
}

+ (id)_objectWithCodable:(id)a3 collection:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C08], "createWithCodable:", a3, a4);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  objc_msgSend(a3, "syncStoreType");
  return 1;
}

+ (BOOL)supportsDateBasedSharding
{
  return 0;
}

+ (id)_basePruningPredicateForDate:(id)a3 profile:(id)a4
{
  return 0;
}

@end
