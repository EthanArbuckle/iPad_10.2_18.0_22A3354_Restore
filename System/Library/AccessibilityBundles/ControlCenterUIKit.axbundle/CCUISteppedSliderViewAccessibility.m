@implementation CCUISteppedSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUISteppedSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUISteppedSliderView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISteppedSliderView"), CFSTR("step"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISteppedSliderView"), CFSTR("numberOfSteps"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISteppedSliderView"), CFSTR("setNumberOfSteps:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIBaseSliderView"), CFSTR("_expanded"), "BOOL");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUISteppedSliderView"), CFSTR("CCUIBaseSliderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CCUIButtonModuleViewController"));

}

- (BOOL)isAccessibilityElement
{
  if ((-[CCUISteppedSliderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_expanded")) & 1) != 0)
    return 1;
  else
    return !-[CCUISteppedSliderViewAccessibility _axIsButtonModuleWhenCollapsed](self, "_axIsButtonModuleWhenCollapsed");
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CCUISteppedSliderViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CCUISteppedSliderViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("step"));
    -[CCUISteppedSliderViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("numberOfSteps"));
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("control.center.step.slider.value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  void *v3;
  id v5;

  -[CCUISteppedSliderViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return v3 != 0;
}

uint64_t __59__CCUISteppedSliderViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490BE4C](CFSTR("CCUIContentModuleContainerViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __59__CCUISteppedSliderViewAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "expandModule");

}

- (void)accessibilityIncrement
{
  -[CCUISteppedSliderViewAccessibility _accessibilityAdjustSliderValueInForwardDirection:](self, "_accessibilityAdjustSliderValueInForwardDirection:", 1);
}

- (void)accessibilityDecrement
{
  -[CCUISteppedSliderViewAccessibility _accessibilityAdjustSliderValueInForwardDirection:](self, "_accessibilityAdjustSliderValueInForwardDirection:", 0);
}

- (void)_accessibilityAdjustSliderValueInForwardDirection:(BOOL)a3
{
  -[CCUISteppedSliderViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("step"));
  -[CCUISteppedSliderViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("numberOfSteps"));
  AXPerformSafeBlock();
}

uint64_t __88__CCUISteppedSliderViewAccessibility__accessibilityAdjustSliderValueInForwardDirection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setStep:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
  return objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUISteppedSliderViewAccessibility;
  -[CCUISteppedSliderViewAccessibility accessibilityCustomActions](&v5, sel_accessibilityCustomActions);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  return v3;
}

- (void)setNumberOfSteps:(unint64_t)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUISteppedSliderViewAccessibility;
  -[CCUISteppedSliderViewAccessibility setNumberOfSteps:](&v6, sel_setNumberOfSteps_, a3);
  if (UIAccessibilityControlCenterModuleIsExpanded())
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&setNumberOfSteps__LastOutput > 1.0)
    {
      v4 = *MEMORY[0x24BDF71E8];
      -[CCUISteppedSliderViewAccessibility _accessibilityAXAttributedValue](self, "_accessibilityAXAttributedValue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v4, v5);

      setNumberOfSteps__LastOutput = CFAbsoluteTimeGetCurrent();
    }
  }
}

- (BOOL)_axIsButtonModuleWhenCollapsed
{
  void *v2;
  BOOL v3;

  -[CCUISteppedSliderViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_207, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __68__CCUISteppedSliderViewAccessibility__axIsButtonModuleWhenCollapsed__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490BE4C](CFSTR("CCUIButtonModuleViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
