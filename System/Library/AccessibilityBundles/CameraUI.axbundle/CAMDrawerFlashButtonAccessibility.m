@implementation CAMDrawerFlashButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerFlashButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerFlashButton"), CFSTR("flashMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerFlashButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerFlashButton"), CFSTR("CAMControlDrawerMenuButton"));

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
  CAMDrawerFlashButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    -[CAMDrawerFlashButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = 2 * (v4 != 1);
    if (v4 == 2)
      v5 = 1;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __58__CAMDrawerFlashButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    v12 = self;
    v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerFlashButtonAccessibility;
    return -[CAMDrawerFlashButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __58__CAMDrawerFlashButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setFlashMode:", *(_QWORD *)(a1 + 40));
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_HINT"));
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_LABEL"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("FlashButton");
}

- (id)accessibilityValue
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[CAMDrawerFlashButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityCameraKitLocalizedString(off_24FEE05C8[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;
  _QWORD v7[5];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMDrawerFlashButtonAccessibility;
  -[CAMDrawerFlashButtonAccessibility layoutSubviews](&v9, sel_layoutSubviews);
  -[CAMDrawerFlashButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3;
  v7[4] = __Block_byref_object_dispose__3;
  -[CAMDrawerFlashButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0110;
  v4[4] = v7;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(v7, 8);

}

void __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14[2];

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("value"));

    v8 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_2;
    v13[3] = &unk_24FEE00C0;
    objc_copyWeak(v14, (id *)(a1 + 40));
    v14[1] = (id)v7;
    objc_msgSend(v5, "_setAccessibilityTraitsBlock:", v13);
    if (v7 >= 3)
    {
      v9 = 0;
    }
    else
    {
      accessibilityCameraKitLocalizedString(off_24FEE05C8[v7]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_3;
    v11[3] = &unk_24FEE00E8;
    v10 = v9;
    v12 = v10;
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v11);

    objc_destroyWeak(v14);
  }

}

uint64_t __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("flashMode")) == *(_QWORD *)(a1 + 40))
    v3 = *MEMORY[0x24BDF7400];
  else
    v3 = 1;
  v4 = v3 | *MEMORY[0x24BDF73B0];

  return v4;
}

id __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_3()
{
  void *v0;
  void *v1;

  accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_LABEL"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerFlashButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerFlashButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
