@implementation CAMControlDrawerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMControlDrawer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("camera.controls"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
