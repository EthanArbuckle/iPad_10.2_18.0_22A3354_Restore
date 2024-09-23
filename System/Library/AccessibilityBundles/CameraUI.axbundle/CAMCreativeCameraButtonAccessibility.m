@implementation CAMCreativeCameraButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMCreativeCameraButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("effects.button"));
}

@end
