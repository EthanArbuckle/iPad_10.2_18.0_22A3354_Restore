@implementation DNDSServerDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___DNDSServerDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("Focus");
}

+ (id)domainName
{
  return CFSTR("Server");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
