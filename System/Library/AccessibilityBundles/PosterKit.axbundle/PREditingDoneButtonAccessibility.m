@implementation PREditingDoneButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingDoneButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.done.button.label"));
}

@end
