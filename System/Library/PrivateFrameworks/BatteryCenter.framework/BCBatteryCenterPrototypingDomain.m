@implementation BCBatteryCenterPrototypingDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BCBatteryCenterPrototypingDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainGroupName
{
  return CFSTR("BatteryCenter");
}

+ (id)domainName
{
  return CFSTR("BatteryDeviceController");
}

+ (Class)rootSettingsClass
{
  return 0;
}

@end
