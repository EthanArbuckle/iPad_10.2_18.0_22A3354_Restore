@implementation MTLumaDodgePillDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MTLumaDodgePillDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("Materials");
}

+ (id)domainName
{
  return CFSTR("Luma Dodge Pill");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

@end
