@implementation DNDSAppSpecificSettingsTypeAppConfigurationPredicate

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)CFSTR("AppConfigurationPredicate");
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(CFSTR("NSPredicate"));
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "predicateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "predicateFormat");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicateFormat:", v6);

}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(CFSTR("NSString"));
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AppConfigurationActionPredicate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("AppConfigurationActionPredicate"));

  v6 = (void *)objc_msgSend(v4, "copy");
  return v6;
}

@end
