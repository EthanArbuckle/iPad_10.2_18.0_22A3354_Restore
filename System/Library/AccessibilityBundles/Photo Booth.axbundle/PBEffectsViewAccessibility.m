@implementation PBEffectsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBEffectsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBEffectsView"), CFSTR("_currentMode"), "q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsView"), CFSTR("_setUpEffectLayers"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsView"), CFSTR("toggleEffectsMode:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBEffectsView"), CFSTR("_nineUpLayers"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PBEffectsView"), CFSTR("_filters"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBEffectsController"), CFSTR("_currentDevicePosition"), "q", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PBEffectsController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("_currentDevicePosition"));
    if (v3 == 1)
    {
      v4 = CFSTR("front.facing.camera.view");
      goto LABEL_8;
    }
    if (!v3)
    {
      v4 = CFSTR("back.facing.camera.view");
LABEL_8:
      axLocalizedString(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    _AXAssert();
  }
  v5 = 0;
LABEL_9:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 0;

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4)
  {
    -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nineUpLayers"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 9)
      _AXAssert();
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "statusBarOrientation");

    if ((unint64_t)(v7 - 3) <= 1 && objc_msgSend(v5, "count") == 9)
    {
      objc_msgSend(v5, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v5;
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)_accessibilityShouldHitTestLayers
{
  void *v2;
  BOOL v3;

  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue") == 1;

  return v3;
}

- (void)toggleEffectsMode:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBEffectsViewAccessibility;
  -[PBEffectsViewAccessibility toggleEffectsMode:](&v3, sel_toggleEffectsMode_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nineUpLayers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setAccessibilityContainer:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PBEffectsViewAccessibility;
  -[PBEffectsViewAccessibility dealloc](&v8, sel_dealloc);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  PBEffectsViewAccessibility *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PBEffectsViewAccessibility;
  -[PBEffectsViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nineUpLayers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBEffectsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_filters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __72__PBEffectsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v6[3] = &unk_2502FA418;
    v7 = v4;
    v8 = self;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  }
  else
  {
    _AXAssert();
  }

}

void __72__PBEffectsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("localizedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);
  objc_msgSend(v6, "setAccessibilityContainer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);

}

- (void)_setUpEffectLayers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBEffectsViewAccessibility;
  -[PBEffectsViewAccessibility _setUpEffectLayers](&v3, sel__setUpEffectLayers);
  -[PBEffectsViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
