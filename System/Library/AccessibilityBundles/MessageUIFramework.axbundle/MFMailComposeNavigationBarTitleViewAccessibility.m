@implementation MFMailComposeNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFMailComposeNavigationBarTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
