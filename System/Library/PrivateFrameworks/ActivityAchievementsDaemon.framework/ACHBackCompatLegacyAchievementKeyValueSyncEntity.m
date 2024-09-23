@implementation ACHBackCompatLegacyAchievementKeyValueSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)objc_msgSend(MEMORY[0x24BE40C70], "identifierWithSchema:entity:", 0, 20);
}

+ (BOOL)setLegacyDataStoreValuesWithDictionary:(id)a3 profile:(id)a4 error:(id *)a5
{
  return objc_msgSend(MEMORY[0x24BE40B88], "setValuesWithDictionary:domain:category:profile:error:", a3, *MEMORY[0x24BE408C0], 106, a4, a5);
}

+ (int64_t)category
{
  return 106;
}

+ (int)nanoSyncObjectType
{
  return 20;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  return a3 < 8;
}

@end
