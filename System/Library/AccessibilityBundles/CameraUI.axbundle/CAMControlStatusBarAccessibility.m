@implementation CAMControlStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("camera.controls.status.bar"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
