@implementation CAMDrawerTimerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerTimerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerTimerButton"), CFSTR("timerDuration"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerTimerButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerTimerButton"), CFSTR("CAMControlDrawerMenuButton"));

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  CAMDrawerTimerButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    v3 = -[CAMDrawerTimerButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("timerDuration"));
    v4 = 3;
    v5 = 1;
    if (v3)
      v5 = v3;
    if (v3 != 1)
      v4 = v5;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __58__CAMDrawerTimerButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    if (v3 == 3)
      v4 = 0;
    v12 = self;
    v13 = v4;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerTimerButtonAccessibility;
    return -[CAMDrawerTimerButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __58__CAMDrawerTimerButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setTimerDuration:", *(_QWORD *)(a1 + 40));
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

  -[CAMDrawerTimerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timerDuration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return accessibilityStringForTimeDuration(v3, v4);
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerTimerButtonAccessibility;
  -[CAMDrawerTimerButtonAccessibility layoutSubviews](&v7, sel_layoutSubviews);
  -[CAMDrawerTimerButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__6;
  v5[4] = __Block_byref_object_dispose__6;
  -[CAMDrawerTimerButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0198;
  v4[4] = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  _Block_object_dispose(v5, 8);

}

void __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("value"));

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke_2;
    v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v8[4] = v7;
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v8);
  }

}

id __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1, __n128 a2)
{
  return accessibilityStringForTimeDuration(*(_QWORD *)(a1 + 32), a2);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerTimerButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerTimerButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
