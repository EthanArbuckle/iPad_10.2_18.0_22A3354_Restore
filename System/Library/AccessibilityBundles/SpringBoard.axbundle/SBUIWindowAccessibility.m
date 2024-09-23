@implementation SBUIWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
}

@end
