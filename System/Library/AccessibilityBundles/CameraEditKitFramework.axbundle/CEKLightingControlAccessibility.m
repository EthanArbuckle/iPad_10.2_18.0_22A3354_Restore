@implementation CEKLightingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKLightingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CEKLightingControlItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("selectedLightingType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("_effectItemsForType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("_effectTypes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("_selectionIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("orientation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControlItem"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:"), "v", "q", "Q", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKLightingControl"), CFSTR("_enabledItemCount"), "Q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraEditKitD2xLocalizedString(CFSTR("lighting.control.label"));
}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CEKLightingControlAccessibility;
  -[CEKLightingControlAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CEKLightingControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedLightingType"));
  objc_opt_class();
  -[CEKLightingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_effectItemsForType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2348BF7E0](CFSTR("CEKLightingControlItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("displayName"));
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKLightingControlAccessibility;
  return *MEMORY[0x24BDF73A0] | -[CEKLightingControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (void)_axChangeToLightingEffectAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  objc_opt_class();
  -[CEKLightingControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_effectTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CEKLightingControlAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_enabledItemCount"));
  if ((a3 & 0x8000000000000000) == 0 && v7 > a3 && objc_msgSend(v6, "count") > (unint64_t)a3)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "integerValue");

    AXPerformSafeBlock();
  }

}

uint64_t __68__CEKLightingControlAccessibility__axChangeToLightingEffectAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSelectedLightingType:atIndex:shouldNotify:shouldSuppressHaptic:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, 0, 1);
}

- (void)accessibilityIncrement
{
  -[CEKLightingControlAccessibility _axChangeToLightingEffectAtIndex:](self, "_axChangeToLightingEffectAtIndex:", -[CEKLightingControlAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_selectionIndex"))+ 1);
}

- (void)accessibilityDecrement
{
  -[CEKLightingControlAccessibility _axChangeToLightingEffectAtIndex:](self, "_axChangeToLightingEffectAtIndex:", -[CEKLightingControlAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_selectionIndex"))- 1);
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)_accessibilityIsVerticalAdjustableElement
{
  return (unint64_t)(-[CEKLightingControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("orientation"))- 3) < 2;
}

@end
