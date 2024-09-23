@implementation PREditingPlusButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditingPlusButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PREditingMinusCloseBoxButton"), CFSTR("UIButton"));
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("editing.add.button.label"));
}

@end
