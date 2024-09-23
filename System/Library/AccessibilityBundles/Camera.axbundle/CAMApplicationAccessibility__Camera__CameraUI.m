@implementation CAMApplicationAccessibility__Camera__CameraUI

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("app.name.camera"));
}

@end
