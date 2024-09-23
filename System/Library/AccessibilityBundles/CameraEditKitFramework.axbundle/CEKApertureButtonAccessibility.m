@implementation CEKApertureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKApertureButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraEditKitD2xLocalizedString(CFSTR("depth.button"));
}

@end
