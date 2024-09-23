@implementation FBSSceneClientSettings

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

- (FBSSceneClientSettings)initWithSettings:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSSceneClientSettings;
  return -[FBSSettings initWithSettings:](&v4, sel_initWithSettings_, a3);
}

+ (id)settings
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSettings:", 0);
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)-[objc_class clientSettingsExtensions](a3, "clientSettingsExtensions");
}

@end
