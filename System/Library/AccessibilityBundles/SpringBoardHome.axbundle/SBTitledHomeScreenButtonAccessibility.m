@implementation SBTitledHomeScreenButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBTitledHomeScreenButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("page.management.focus.options.button"));
}

@end
