@implementation UIStatusBar_BaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBar_Base");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 25;
}

@end
