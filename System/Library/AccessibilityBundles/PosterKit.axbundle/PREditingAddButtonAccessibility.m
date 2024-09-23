@implementation PREditingAddButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingAddButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.add.button.label"));
}

@end
