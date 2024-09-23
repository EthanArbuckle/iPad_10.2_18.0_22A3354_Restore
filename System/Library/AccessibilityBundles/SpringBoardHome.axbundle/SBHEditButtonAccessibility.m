@implementation SBHEditButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHEditButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("edit.button.label"));
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
