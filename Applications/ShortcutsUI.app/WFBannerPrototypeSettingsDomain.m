@implementation WFBannerPrototypeSettingsDomain

+ (id)rootSettings
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___WFBannerPrototypeSettingsDomain;
  v2 = objc_msgSendSuper2(&v4, "rootSettings");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)domainGroupName
{
  return CFSTR("Shortcuts");
}

+ (id)domainName
{
  return CFSTR("Runtime UI");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class(WFBannerPrototypeSettings, a2);
}

@end
