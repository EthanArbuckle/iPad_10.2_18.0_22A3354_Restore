@implementation WDManualDataEntryTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDManualDataEntryTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDManualDataEntryTableViewCell"), CFSTR("_valueField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDManualDataEntryTableViewCell"), CFSTR("_displayNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("WDManualDataEntryTableViewCell"), CFSTR("_unitLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WDManualDataEntryTableViewCell"), CFSTR("_setupUIWithDisplayName: unitName:"), "v", "@", "@", 0);

}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDManualDataEntryTableViewCellAccessibility;
  -[WDManualDataEntryTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[WDManualDataEntryTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_displayNameLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDManualDataEntryTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unitLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);
  -[WDManualDataEntryTableViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXDisplayLabelOverrideKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityLabel:", v7, v8, CFSTR("__AXStringForVariablesSentinel"));
}

- (void)_setupUIWithDisplayName:(id)a3 unitName:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDManualDataEntryTableViewCellAccessibility;
  -[WDManualDataEntryTableViewCellAccessibility _setupUIWithDisplayName:unitName:](&v5, sel__setupUIWithDisplayName_unitName_, a3, a4);
  -[WDManualDataEntryTableViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
