@implementation SBHEditingDoneButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHEditingDoneButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("done.button.label"));
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
