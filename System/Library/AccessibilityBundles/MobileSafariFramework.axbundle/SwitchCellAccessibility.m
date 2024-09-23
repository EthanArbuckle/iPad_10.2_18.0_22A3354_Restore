@implementation SwitchCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFBrowsingAssistantSwitchCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("_SFBrowsingAssistantSwitchCell"), CFSTR("switch"), "UISwitch");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UISwitch"), CFSTR("_on"), "BOOL");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SwitchCellAccessibility;
  -[SwitchCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SwitchCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("switch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)accessibilityElement
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SwitchCellAccessibility;
  -[SwitchCellAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  -[SwitchCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("switch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_on"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v3, "setOn:animated:", v5 ^ 1u, 1);
  return 1;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SwitchCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("switch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
