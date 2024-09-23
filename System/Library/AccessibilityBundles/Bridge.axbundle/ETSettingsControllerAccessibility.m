@implementation ETSettingsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETSettingsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
