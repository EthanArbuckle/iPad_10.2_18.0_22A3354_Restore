@implementation CAMExternalStorageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMExternalStorageButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  return accessibilityCameraUILocalizedString(CFSTR("on.state"));
}

@end
