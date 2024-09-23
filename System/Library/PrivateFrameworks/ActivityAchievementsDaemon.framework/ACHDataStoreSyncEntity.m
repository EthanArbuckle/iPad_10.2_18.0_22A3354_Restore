@implementation ACHDataStoreSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)objc_msgSend(MEMORY[0x24BE40C70], "identifierWithSchema:entity:", 0, 21);
}

+ (id)dataStoreValueForKey:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(MEMORY[0x24BE40B88], "numberForKey:domain:category:profile:entity:error:", a3, a4, 107, a5, 0, a6);
}

+ (BOOL)setDataStoreValuesWithDictionary:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return objc_msgSend(MEMORY[0x24BE40B88], "setValuesWithDictionary:domain:category:profile:error:", a3, a4, 107, a5, a6);
}

+ (BOOL)removeDataStoreValuesForKeys:(id)a3 domain:(id)a4 profile:(id)a5 error:(id *)a6
{
  return objc_msgSend(MEMORY[0x24BE40B88], "removeValuesForDomain:category:keys:profile:error:", a4, 107, a3, a5, a6);
}

+ (int64_t)category
{
  return 107;
}

+ (void)didReceiveValuesForKeys:(id)a3 profile:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ACHDataStoreSyncEntityDidReceiveValuesNotification"), a1);

}

+ (int)nanoSyncObjectType
{
  return 21;
}

+ (unint64_t)supportedNanoSyncDirectionsForProtocolVersion:(int)a3
{
  if (a3 >= 8)
    return 3;
  else
    return 0;
}

@end
