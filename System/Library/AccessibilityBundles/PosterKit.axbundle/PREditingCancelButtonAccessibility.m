@implementation PREditingCancelButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingCancelButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.cancel.button.label"));
}

@end
