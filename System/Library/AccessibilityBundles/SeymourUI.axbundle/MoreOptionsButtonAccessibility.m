@implementation MoreOptionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.MoreOptionsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("more.button"));
}

@end
