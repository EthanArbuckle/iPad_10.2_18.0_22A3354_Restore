@implementation ModeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.ModeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ModeControl"), CFSTR("selectedSegmentIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ModeControl"), CFSTR("buttons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Measure.ModeControl"), CFSTR("updateHighlightState"), "v", 0);

}

- (id)_axButtons
{
  return (id)-[ModeControlAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("buttons"));
}

- (void)_axAnnotateSelectedButton
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  v3 = -[ModeControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectedSegmentIndex"));
  -[ModeControlAccessibility _axButtons](self, "_axButtons");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__ModeControlAccessibility__axAnnotateSelectedButton__block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v5[4] = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __53__ModeControlAccessibility__axAnnotateSelectedButton__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSetIsActuallySelected:", v6 == a3);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)ModeControlAccessibility;
  -[ModeControlAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[ModeControlAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF7420]);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[ModeControlAccessibility _axButtons](self, "_axButtons", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_accessibilityDidMoveToTabBar");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  -[ModeControlAccessibility _axAnnotateSelectedButton](self, "_axAnnotateSelectedButton");
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)updateHighlightState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ModeControlAccessibility;
  -[ModeControlAccessibility updateHighlightState](&v3, sel_updateHighlightState);
  -[ModeControlAccessibility _axAnnotateSelectedButton](self, "_axAnnotateSelectedButton");
}

@end
