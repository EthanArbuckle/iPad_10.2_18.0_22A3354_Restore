@implementation HDProtectedNanoUserDefaultsSyncEntity

+ (int64_t)category
{
  return 105;
}

+ (int)nanoSyncObjectType
{
  return 17;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 17);
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

@end
