@implementation SBUICallToActionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUICallToActionLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUICallToActionLabel"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUILegibilityLabel"), CFSTR("attributedText"), "@", 0);

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUICallToActionLabelAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SBUICallToActionLabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unlockDevice");

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[SBUICallToActionLabelAccessibility _accessibilityHandlePreboardUnlock](self, "_accessibilityHandlePreboardUnlock");
  return 1;
}

- (id)accessibilityAttributedLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[SBUICallToActionLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v4, "attribute:atIndex:effectiveRange:", CFSTR("NSLanguage"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BDD1458]);
  v9 = v8;
  if (v6)
  {
    v13 = *MEMORY[0x24BDF7358];
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithString:attributes:", v7, v10);

  }
  else
  {
    v11 = (void *)objc_msgSend(v8, "initWithString:", v7);
  }

  return v11;
}

- (void)_accessibilityHandlePreboardUnlock
{
  -[SBUICallToActionLabelAccessibility _accessibilityTryUnlockForControllerClassName:](self, "_accessibilityTryUnlockForControllerClassName:", CFSTR("PBADeviceUnlockViewController"));
  -[SBUICallToActionLabelAccessibility _accessibilityTryUnlockForControllerClassName:](self, "_accessibilityTryUnlockForControllerClassName:", CFSTR("PBADataRecoveryViewController"));
}

- (void)_accessibilityTryUnlockForControllerClassName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke;
  v9[3] = &unk_250390220;
  v10 = v4;
  v5 = v4;
  -[SBUICallToActionLabelAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  AXPerformSafeBlock();

}

uint64_t __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(*(NSString **)(a1 + 32));
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

uint64_t __84__SBUICallToActionLabelAccessibility__accessibilityTryUnlockForControllerClassName___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_homeButtonPressed:", 0);
}

@end
