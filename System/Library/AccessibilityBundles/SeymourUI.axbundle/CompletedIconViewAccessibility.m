@implementation CompletedIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.CompletedIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("completed.icon"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
