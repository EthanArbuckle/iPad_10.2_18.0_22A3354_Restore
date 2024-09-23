@implementation HDUnprotectedNanoUserDefaultsSyncEntity

+ (int64_t)category
{
  return 1;
}

+ (int)nanoSyncObjectType
{
  return 16;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 16);
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 1;
}

@end
