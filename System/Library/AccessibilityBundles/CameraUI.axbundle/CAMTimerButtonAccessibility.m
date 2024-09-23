@implementation CAMTimerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMTimerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMTimerButton"), CFSTR("duration"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMTimerButton"), CFSTR("setDuration:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandableMenuButton"), CFSTR("startExpansionWithProposedFrame:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMTimerButton"), CFSTR("CAMExpandableMenuButton"));

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CAMTimerButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    -[CAMTimerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("duration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = 3;
    if (v4 != 1)
      v5 = 1;
    if (v4 == 3)
      v5 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __52__CAMTimerButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    v12 = self;
    v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMTimerButtonAccessibility;
    return -[CAMTimerButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __52__CAMTimerButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setDuration:animated:", *(_QWORD *)(a1 + 40), 1);
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(CFSTR("timer.button.hint"));
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("timer.button"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("TimerButton");
}

- (id)accessibilityValue
{
  void *v2;
  uint64_t v3;
  __n128 v4;

  -[CAMTimerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return accessibilityStringForTimeDuration(v3, v4);
}

- (void)startExpansionWithProposedFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMTimerButtonAccessibility;
  -[CAMTimerButtonAccessibility startExpansionWithProposedFrame:](&v5, sel_startExpansionWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  -[CAMTimerButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_menuItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_16);

}

void __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  _QWORD v5[5];

  v4 = a2;
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2;
  v5[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v5[4] = a3;
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);

}

id __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2(uint64_t a1, __n128 a2)
{
  return accessibilityStringForTimeDuration(*(_QWORD *)(a1 + 32), a2);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMTimerButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMTimerButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
