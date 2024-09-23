@implementation HDUnprotectedKeyValueNanoSyncEntity

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return 3;
}

+ (BOOL)supportsSpeculativeNanoSyncChanges
{
  return 0;
}

+ (int64_t)category
{
  return 5;
}

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 68);
}

+ (BOOL)supportsSyncStore:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "syncStoreType");
  return v3 < 6 && (v3 & 0x3F) == 1;
}

@end
