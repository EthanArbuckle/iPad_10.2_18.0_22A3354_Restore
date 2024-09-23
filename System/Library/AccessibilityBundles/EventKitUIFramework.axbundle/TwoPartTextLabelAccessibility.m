@implementation TwoPartTextLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TwoPartTextLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoPartTextLabel"), CFSTR("_secondTextPart"), "NSString");
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("add.event.tablecells.hint"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TwoPartTextLabelAccessibility;
  -[TwoPartTextLabelAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoPartTextLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondTextPart"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
