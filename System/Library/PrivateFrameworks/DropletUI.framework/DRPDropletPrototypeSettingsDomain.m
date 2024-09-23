@implementation DRPDropletPrototypeSettingsDomain

+ (id)rootSettings
{
  id result;
  objc_super v3;

  swift_getObjCClassMetadata();
  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___DRPDropletPrototypeSettingsDomain;
  result = objc_msgSendSuper2(&v3, sel_rootSettings);
  if (result)
  {
    objc_opt_self();
    return (id)swift_dynamicCastObjCClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)domainGroupName
{
  return (id)sub_23A84C210();
}

+ (id)domainName
{
  return (id)sub_23A84C210();
}

+ (Class)rootSettingsClass
{
  type metadata accessor for DRPDropletPrototypeSettings(0);
  return (Class)swift_getObjCClassFromMetadata();
}

@end
