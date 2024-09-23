@implementation SBHEditingWidgetButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHEditingWidgetButton");
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
  return accessibilityLocalizedString(CFSTR("add.widget.button.label"));
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

@end
