@implementation SBDashBoardSetupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDashBoardSetupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardSetupView"), CFSTR("setTitleString:forLanguage:"), "d", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardSetupView"), CFSTR("setActivationLockWarningString:detailString:forLanguage:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_homeAffordanceCallToActionContainer"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_homeAffordanceCallToActionLabel"), "SBUILegibilityLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_activationLockStackView"), "UIStackView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_activationLockWarningLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDashBoardSetupView"), CFSTR("_activationLockDetailLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDashBoardSetupView"), CFSTR("_addActivationLockLabels"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardSetupViewAccessibility;
  -[SBDashBoardSetupViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SBDashBoardSetupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_homeAffordanceCallToActionContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetOverridesInvisibility:", 1);

  -[SBDashBoardSetupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_homeAffordanceCallToActionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("HomeAffordanceLabel"));

  -[SBDashBoardSetupViewAccessibility _axSetupActivationLockLabels](self, "_axSetupActivationLockLabels");
}

- (id)_accessibilitySafeStackView
{
  return (id)-[SBDashBoardSetupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_activationLockStackView"));
}

- (void)_axSetupActivationLockLabels
{
  void *v3;
  void *v4;
  id v5;

  -[SBDashBoardSetupViewAccessibility _accessibilitySafeStackView](self, "_accessibilitySafeStackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardSetupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_activationLockWarningLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardSetupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_activationLockDetailLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetOverridesInvisibility:", 1);
  objc_msgSend(v3, "_accessibilitySetOverridesInvisibility:", 1);
  objc_msgSend(v4, "_accessibilitySetOverridesInvisibility:", 1);
  objc_msgSend(v5, "_accessibilitySetViewIsVisible:", 1);
  objc_msgSend(v3, "_accessibilitySetViewIsVisible:", 1);
  objc_msgSend(v4, "_accessibilitySetViewIsVisible:", 1);
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);

}

- (double)setTitleString:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  objc_super v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SBDashBoardSetupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v8, "_accessibilitySetOverridesInvisibility:", 1);
  if (v6 && v7)
  {
    v9 = objc_alloc(MEMORY[0x24BDD1458]);
    v16 = *MEMORY[0x24BDF7358];
    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v6, v10);

    objc_msgSend(v8, "setAccessibilityAttributedLabel:", v11);
  }
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardSetupViewAccessibility;
  -[SBDashBoardSetupViewAccessibility setTitleString:forLanguage:](&v15, sel_setTitleString_forLanguage_, v6, v7);
  v13 = v12;

  return v13;
}

- (void)setActivationLockWarningString:(id)a3 detailString:(id)a4 forLanguage:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SBDashBoardSetupViewAccessibility;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBDashBoardSetupViewAccessibility setActivationLockWarningString:detailString:forLanguage:](&v17, sel_setActivationLockWarningString_detailString_forLanguage_, v10, v9, v8);
  -[SBDashBoardSetupViewAccessibility _accessibilitySafeStackView](self, "_accessibilitySafeStackView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BDD1458]);
  __AXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x24BDF7358];
  v19[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v9, CFSTR("__AXStringForVariablesSentinel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v14);
  objc_msgSend(v11, "setAccessibilityAttributedLabel:", v15);

  LODWORD(v15) = *MEMORY[0x24BDF72C8];
  -[SBDashBoardSetupViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_activationLockStackView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v16);

}

- (void)_addActivationLockLabels
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardSetupViewAccessibility;
  -[SBDashBoardSetupViewAccessibility _addActivationLockLabels](&v3, sel__addActivationLockLabels);
  -[SBDashBoardSetupViewAccessibility _axSetupActivationLockLabels](self, "_axSetupActivationLockLabels");
}

@end
