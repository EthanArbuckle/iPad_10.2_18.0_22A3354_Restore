@implementation BKUIPearlEnrollViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BKUIPearlEnrollViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("BKUIPearlPillContainerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("bottomContainer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollViewBottomContainer"), CFSTR("instructionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("instructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlInstructionView"), CFSTR("detailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_state"), "int");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_substate"), "int");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_enrollView"), "BKUIPearlEnrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BKUIPearlEnrollView"), CFSTR("_pillContainer"), "BKUIPearlPillContainerView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("finalizeInstructionAnimation"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_setState:animated:completion:"), "v", "i", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BKUIPearlEnrollViewController"), CFSTR("_setSubstate:animated:"), "v", "i", "B", 0);

}

- (id)_accessibilityInstructionView
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bottomContainer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("instructionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityInstructionLabel
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityInstructionView](self, "_accessibilityInstructionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("instructionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityDetailLabel
{
  void *v2;
  void *v3;

  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityInstructionView](self, "_accessibilityInstructionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("detailLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityInstructionLabel](self, "_accessibilityInstructionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_opt_class();
  -[BKUIPearlEnrollViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_enrollView._pillContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilitySetPearlEnrollViewController:", self);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  -[BKUIPearlEnrollViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)finalizeInstructionAnimation
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  -[BKUIPearlEnrollViewControllerAccessibility finalizeInstructionAnimation](&v5, sel_finalizeInstructionAnimation);
  v3 = *MEMORY[0x24BDF72C8];
  -[BKUIPearlEnrollViewControllerAccessibility _accessibilityInstructionLabel](self, "_accessibilityInstructionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  int v9;
  void *v10;
  objc_super v11;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = -[BKUIPearlEnrollViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_state"));
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  -[BKUIPearlEnrollViewControllerAccessibility _setState:animated:completion:](&v11, sel__setState_animated_completion_, v6, v5, v8);

  if (v9 != (_DWORD)v6 && UIAccessibilityIsVoiceOverRunning())
  {
    if ((_DWORD)v6 == 5)
    {
      accessibilityLocalizedString(CFSTR("pearl.positioning.correct"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
    else if ((_DWORD)v6 == 3)
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

void __76__BKUIPearlEnrollViewControllerAccessibility__setState_animated_completion___block_invoke(uint64_t a1)
{
  unsigned int v2;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeIntForKey:", CFSTR("_substate"));
  if (objc_msgSend(*(id *)(a1 + 32), "safeIntForKey:", CFSTR("_state")) == 3 && v2 <= 9)
  {
    accessibilityLocalizedString(CFSTR("pearl.positioning.help"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)_axProvidePositioningInstruction
{
  unsigned int v2;
  id v3;

  v2 = -[BKUIPearlEnrollViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_substate")) - 1;
  if (v2 <= 0xE && ((0x7F03u >> v2) & 1) != 0)
  {
    accessibilityLocalizedString(*(&off_250193C50 + (int)v2));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
}

- (void)_setSubstate:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  int v7;
  int v8;
  id v9;
  objc_super v10;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = -[BKUIPearlEnrollViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_substate"));
  v10.receiver = self;
  v10.super_class = (Class)BKUIPearlEnrollViewControllerAccessibility;
  -[BKUIPearlEnrollViewControllerAccessibility _setSubstate:animated:](&v10, sel__setSubstate_animated_, v5, v4);
  v8 = -[BKUIPearlEnrollViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("_state"));
  if ((v8 & 0xFFFFFFFD) == 5)
  {
    if (v7 == (_DWORD)v5 || !(v5 | v7))
      return;
  }
  else if (v5 < 0xA || v8 != 4 || v7 == (_DWORD)v5)
  {
    return;
  }
  AXPerformBlockOnMainThreadAfterDelay();
  if ((v5 - 11) < 5 || (v5 & 0xFFFFFFF7) - 1 <= 1)
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axProvidePositioningInstruction, 0, 0, 5.0);
}

void __68__BKUIPearlEnrollViewControllerAccessibility__setSubstate_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityInstructionLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityDetailLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

@end
