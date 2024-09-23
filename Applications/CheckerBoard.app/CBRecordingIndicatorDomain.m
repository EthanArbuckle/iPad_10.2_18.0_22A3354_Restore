@implementation CBRecordingIndicatorDomain

+ (id)rootSettings
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CBRecordingIndicatorDomain;
  v2 = objc_msgSendSuper2(&v4, "rootSettings");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

+ (id)domainGroupName
{
  return CFSTR("CheckerBoard");
}

+ (id)domainName
{
  return CFSTR("Recording Indicator");
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class(CBRecordingIndicatorSettings, a2);
}

@end
