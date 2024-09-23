@implementation DNDSAppSpecificSettingsTypeAppConfigurationAction

+ (NSString)appSpecificSettingsEntity
{
  return (NSString *)CFSTR("AppConfigurationAction");
}

+ (Class)appSpecificSettingsClass
{
  return NSClassFromString(CFSTR("DNDAppAction"));
}

+ (id)appSpecificSettingsForManagedObject:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x1E0D1D570];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "encodedAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "enabled");

  v11 = (void *)objc_msgSend(v5, "initWithEncodedAction:actionIdentifier:bundleIdentifier:enabled:", v6, v7, v9, v10);
  return v11;
}

+ (void)completeManagedObject:(id)a3 forAppSpecificSettings:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a4;
  v11 = a3;
  objc_msgSend(v11, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v5, "encodedAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEncodedAction:", v9);

  v10 = objc_msgSend(v5, "isEnabled");
  objc_msgSend(v11, "setEnabled:", v10);

}

+ (Class)appSpecificSettingsEncodedClass
{
  return NSClassFromString(CFSTR("NSDictionary"));
}

+ (id)appSpecificSettingsFromDictionaryRepresentation:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D1D570], "appActionFromDictionaryRepresentation:", a3);
}

+ (id)dictionaryRepresentationForAppSpecificSettings:(id)a3
{
  return (id)objc_msgSend(a3, "dictionaryRepresentation");
}

@end
