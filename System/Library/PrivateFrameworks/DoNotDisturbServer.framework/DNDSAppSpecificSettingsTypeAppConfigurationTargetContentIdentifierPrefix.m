@implementation DNDSAppSpecificSettingsTypeAppConfigurationTargetContentIdentifierPrefix

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)CFSTR("AppConfigurationTargetContentIdentifierPrefix");
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(CFSTR("NSString"));
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  return (id)objc_msgSend(a3, "targetContentIdentifierPrefix");
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  objc_msgSend(a3, "setTargetContentIdentifierPrefix:", a4);
}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(CFSTR("NSString"));
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AppConfigurationTargetContentIdentifierPrefix"));
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("AppConfigurationTargetContentIdentifierPrefix"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
