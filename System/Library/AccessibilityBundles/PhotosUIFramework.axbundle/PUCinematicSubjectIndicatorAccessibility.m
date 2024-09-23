@implementation PUCinematicSubjectIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUCinematicSubjectIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCountdownTimer
{
  JUMPOUT(0x2348C1CECLL);
}

- (void)_setAXCountdownTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PUVideoEditOverlayViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PUVideoEditOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUCinematicSubjectIndicator"), CFSTR("shape"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  unint64_t v2;
  void *v3;

  v2 = -[PUCinematicSubjectIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("shape")) - 1;
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    accessibilityPULocalizedString(off_24FF150D8[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityHint
{
  unint64_t v2;
  void *v3;

  v2 = -[PUCinematicSubjectIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("shape"));
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    accessibilityPULocalizedString(off_24FF150F0[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_axVideoEditOverlayViewController
{
  void *v2;
  void *v3;

  -[PUCinematicSubjectIndicatorAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__PUCinematicSubjectIndicatorAccessibility__axVideoEditOverlayViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PUVideoEditOverlayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCinematicSubjectIndicatorAccessibility;
  -[PUCinematicSubjectIndicatorAccessibility accessibilityElementDidBecomeFocused](&v9, sel_accessibilityElementDidBecomeFocused);
  -[PUCinematicSubjectIndicatorAccessibility _axVideoEditOverlayViewController](self, "_axVideoEditOverlayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axSetCinematicSubjectIndicatorDidBecomeFocused:", 1);
  -[PUCinematicSubjectIndicatorAccessibility _axCountdownTimer](self, "_axCountdownTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDFE490]);
    v4 = (void *)objc_msgSend(v5, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[PUCinematicSubjectIndicatorAccessibility _setAXCountdownTimer:](self, "_setAXCountdownTimer:", v4);
  }
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__PUCinematicSubjectIndicatorAccessibility_accessibilityElementDidBecomeFocused__block_invoke;
  v6[3] = &unk_24FF150B8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "afterDelay:processBlock:", v6, 0.05);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __80__PUCinematicSubjectIndicatorAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axUpdateElementFrame");

}

- (void)accessibilityElementDidLoseFocus
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PUCinematicSubjectIndicatorAccessibility _axVideoEditOverlayViewController](self, "_axVideoEditOverlayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axSetCinematicSubjectIndicatorDidBecomeFocused:", 0);
  v5.receiver = self;
  v5.super_class = (Class)PUCinematicSubjectIndicatorAccessibility;
  -[PUCinematicSubjectIndicatorAccessibility accessibilityElementDidLoseFocus](&v5, sel_accessibilityElementDidLoseFocus);
  -[PUCinematicSubjectIndicatorAccessibility _axCountdownTimer](self, "_axCountdownTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (void)_axUpdateElementFrame
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[PUCinematicSubjectIndicatorAccessibility _axCountdownTimer](self, "_axCountdownTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDFE490]);
    v3 = (void *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[PUCinematicSubjectIndicatorAccessibility _setAXCountdownTimer:](self, "_setAXCountdownTimer:", v3);
  }
  if (-[PUCinematicSubjectIndicatorAccessibility accessibilityElementIsFocused](self, "accessibilityElementIsFocused"))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAF98], self);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __65__PUCinematicSubjectIndicatorAccessibility__axUpdateElementFrame__block_invoke;
    v5[3] = &unk_24FF150B8;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v3, "afterDelay:processBlock:", v5, 0.05);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

void __65__PUCinematicSubjectIndicatorAccessibility__axUpdateElementFrame__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axUpdateElementFrame");

}

- (AXDispatchTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
