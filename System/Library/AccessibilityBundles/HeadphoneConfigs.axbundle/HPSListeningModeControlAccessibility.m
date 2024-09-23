@implementation HPSListeningModeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HPSListeningModeControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HPSListeningModeControl"), CFSTR("_segmentedControl"), "UISegmentedControl");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UISegmentedControl"), CFSTR("_segments"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HPSListeningModeControl"), CFSTR("addModeOptions"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HPSListeningModeControl"), CFSTR("getListeningModeFromIndex:"), "i", "q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HPSListeningModeControlAccessibility;
  -[HPSListeningModeControlAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[HPSListeningModeControlAccessibility _axSetSegmentLabels](self, "_axSetSegmentLabels");
}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[HPSListeningModeControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_segmentedControl"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HPSListeningModeControlAccessibility;
    -[HPSListeningModeControlAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)addModeOptions
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HPSListeningModeControlAccessibility;
  -[HPSListeningModeControlAccessibility addModeOptions](&v3, sel_addModeOptions);
  -[HPSListeningModeControlAccessibility _axSetSegmentLabels](self, "_axSetSegmentLabels");
}

- (void)_axSetSegmentLabels
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  LOBYTE(v10) = 0;
  objc_opt_class();
  -[HPSListeningModeControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_segmentedControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_segments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x2020000000;
      v13 = 0;
      AXPerformSafeBlock();
      v7 = *((unsigned int *)v11 + 6);
      _Block_object_dispose(&v10, 8);
      objc_msgSend(v5, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSListeningModeControlAccessibility _axLabelForBTListeningMode:](self, "_axLabelForBTListeningMode:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessibilityLabel:", v9);

      ++v6;
    }
    while (v6 < objc_msgSend(v5, "count"));
  }

}

uint64_t __59__HPSListeningModeControlAccessibility__axSetSegmentLabels__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getListeningModeFromIndex:", *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_axLabelForBTListeningMode:(int)a3
{
  if ((a3 - 1) > 3)
    return 0;
  accessibilityLocalizedString(off_25021E8F8[a3 - 1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
