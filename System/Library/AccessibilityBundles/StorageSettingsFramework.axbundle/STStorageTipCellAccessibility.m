@implementation STStorageTipCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageTipCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_progressLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_enableButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_spinner"), "UIActivityIndicatorView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_checkIconView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTipCell"), CFSTR("_percent"), "f");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  int v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStorageTipCellAccessibility;
  -[STStorageTipCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v3 = _AXSAutomationEnabled();
  objc_opt_class();
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkIconView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsAccessibilityElement:", v3 != 0);
}

- (id)accessibilityLabel
{
  return (id)-[STStorageTipCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _progressLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_enableButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    v5 = CFSTR("tip.cell.not.enabled");
  }
  else
  {
    -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkIconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");

    if (!v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)STStorageTipCellAccessibility;
      -[STStorageTipCellAccessibility accessibilityValue](&v10, sel_accessibilityValue);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    v5 = CFSTR("tip.cell.enabled");
  }
  accessibilityPreferencesFrameworkBundleLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v10;

  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_enableButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    v5 = CFSTR("tip.cell.not.enabled.hint");
  }
  else
  {
    -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkIconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_accessibilityViewIsVisible");

    if (!v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)STStorageTipCellAccessibility;
      -[STStorageTipCellAccessibility accessibilityValue](&v10, sel_accessibilityValue);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    v5 = CFSTR("tip.cell.enabled.hint");
  }
  accessibilityPreferencesFrameworkBundleLocalizedString(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STStorageTipCellAccessibility;
  v3 = -[STStorageTipCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_enableButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");
  v6 = *MEMORY[0x24BDF73B0];
  if (!v5)
    v6 = 0;
  v7 = v6 | v3;

  return v7;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_progressLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_enableButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_spinner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkIconView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 5, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "axFilterObjectsUsingBlock:", &__block_literal_global_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__STStorageTipCellAccessibility_automationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden") ^ 1;

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[STStorageTipCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_enableButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

@end
