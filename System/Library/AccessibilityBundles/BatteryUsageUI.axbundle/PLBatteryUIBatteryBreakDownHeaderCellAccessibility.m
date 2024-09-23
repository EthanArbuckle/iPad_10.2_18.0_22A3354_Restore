@implementation PLBatteryUIBatteryBreakDownHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLBatteryUIBatteryBreakDownHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("breakdownTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("breakdownToggleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("refreshCellContentsWithSpecifier:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIBatteryBreakDownHeaderCell"), CFSTR("buttonAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("BatteryUIController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BatteryUIController"), CFSTR("_iconDisplayType"), "i");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("breakdownTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("breakdownToggleButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subviews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
    -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)buttonAction:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLBatteryUIBatteryBreakDownHeaderCellAccessibility;
  -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility buttonAction:](&v8, sel_buttonAction_, a3);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[PLBatteryUIBatteryBreakDownHeaderCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234908B68](CFSTR("BatteryUIController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v4, "safeIntForKey:", CFSTR("_iconDisplayType"));
      if (!v5)
      {
        v6 = CFSTR("battery.show.percentage.confirmation");
        goto LABEL_7;
      }
      if (v5 == 1)
      {
        v6 = CFSTR("battery.show.screenon.confirmation");
LABEL_7:
        accessibilityLocalizedString(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilitySpeakAndDoNotBeInterrupted();

      }
    }

  }
}

@end
