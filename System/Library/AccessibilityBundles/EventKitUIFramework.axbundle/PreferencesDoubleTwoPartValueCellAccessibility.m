@implementation PreferencesDoubleTwoPartValueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PreferencesDoubleTwoPartValueCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesDoubleTwoPartValueCell"), CFSTR("textLabel2"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesDoubleTwoPartValueCell"), CFSTR("twoPartTextLabel2"), "@", 0);

}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("add.event.tablecells.hint"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PreferencesDoubleTwoPartValueCellAccessibility;
  -[PreferencesDoubleTwoPartValueCellAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PreferencesDoubleTwoPartValueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PreferencesDoubleTwoPartValueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("twoPartTextLabel2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
