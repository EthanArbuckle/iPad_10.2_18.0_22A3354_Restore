@implementation RPControlCenterMenuModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RPControlCenterMenuModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCountdownTimer
{
  JUMPOUT(0x2349240C4);
}

- (void)_setAXCountdownTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RPControlCenterMenuModuleViewController"), CFSTR("updateStateAndUI"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RPControlCenterMenuModuleViewController"), CFSTR("transitionToCountdownState"), "v", 0);

}

- (void)updateStateAndUI
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RPControlCenterMenuModuleViewControllerAccessibility;
  -[RPControlCenterMenuModuleViewControllerAccessibility updateStateAndUI](&v4, sel_updateStateAndUI);
  -[RPControlCenterMenuModuleViewControllerAccessibility _axCountdownTimer](self, "_axCountdownTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)_axSpeakAndGo:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  AXFormatInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  if (a3 >= 2)
  {
    -[RPControlCenterMenuModuleViewControllerAccessibility _axCountdownTimer](self, "_axCountdownTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__RPControlCenterMenuModuleViewControllerAccessibility__axSpeakAndGo___block_invoke;
    v7[3] = &unk_2503CEA40;
    v7[4] = self;
    v7[5] = a3;
    objc_msgSend(v6, "afterDelay:processBlock:", v7, 1.0);

  }
}

uint64_t __70__RPControlCenterMenuModuleViewControllerAccessibility__axSpeakAndGo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axSpeakAndGo:", *(_QWORD *)(a1 + 40) - 1);
}

- (void)transitionToCountdownState
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterMenuModuleViewControllerAccessibility;
  -[RPControlCenterMenuModuleViewControllerAccessibility transitionToCountdownState](&v5, sel_transitionToCountdownState);
  -[RPControlCenterMenuModuleViewControllerAccessibility _axCountdownTimer](self, "_axCountdownTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDFE490]);
    v3 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[RPControlCenterMenuModuleViewControllerAccessibility _setAXCountdownTimer:](self, "_setAXCountdownTimer:", v3);
  }
  -[RPControlCenterMenuModuleViewControllerAccessibility _axSpeakAndGo:](self, "_axSpeakAndGo:", 3);

}

- (unint64_t)_accessibilityControlCenterButtonAdditionalTraits
{
  return *MEMORY[0x24BDF7408];
}

@end
