@implementation CAMDrawerSharedLibraryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerSharedLibraryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerSharedLibraryButton"), CFSTR("sharedLibraryMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerSharedLibraryButton"), CFSTR("setSharedLibraryMode:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerSharedLibraryButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerSharedLibraryButton"), CFSTR("CAMControlDrawerMenuButton"));

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  objc_super v5;

  if (AXRequestingClient() == 3)
  {
    -[CAMDrawerSharedLibraryButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("sharedLibraryMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "integerValue");

    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
    return -[CAMDrawerSharedLibraryButtonAccessibility accessibilityActivate](&v5, sel_accessibilityActivate);
  }
}

void __66__CAMDrawerSharedLibraryButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setSharedLibraryMode:animated:", *(_QWORD *)(a1 + 40), 0);
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(CFSTR("Shared_Library_Hint"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("SharedLibraryButton");
}

- (id)_axLabelForSharedLibraryMode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  accessibilityCameraUILocalizedString(off_24FEE0130[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  return -[CAMDrawerSharedLibraryButtonAccessibility _axLabelForSharedLibraryMode:](self, "_axLabelForSharedLibraryMode:", -[CAMDrawerSharedLibraryButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("sharedLibraryMode")));
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
  v9.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
  -[CAMDrawerSharedLibraryButtonAccessibility layoutSubviews](&v9, sel_layoutSubviews);
  -[CAMDrawerSharedLibraryButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy_;
  v7[4] = __Block_byref_object_dispose_;
  -[CAMDrawerSharedLibraryButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0110;
  v4[4] = v7;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(v7, 8);

}

void __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id WeakRetained;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16[2];

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "safeIntegerForKey:", CFSTR("value"));

    v8 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_2;
    v15[3] = &unk_24FEE00C0;
    v9 = (id *)(a1 + 40);
    objc_copyWeak(v16, v9);
    v16[1] = v7;
    objc_msgSend(v5, "_setAccessibilityTraitsBlock:", v15);
    WeakRetained = objc_loadWeakRetained(v9);
    objc_msgSend(WeakRetained, "_axLabelForSharedLibraryMode:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_3;
    v13[3] = &unk_24FEE00E8;
    v12 = v11;
    v14 = v12;
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v13);

    objc_destroyWeak(v16);
  }

}

uint64_t __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("sharedLibraryMode")) == *(_QWORD *)(a1 + 40))
    v3 = *MEMORY[0x24BDF7400];
  else
    v3 = 1;
  v4 = v3 | *MEMORY[0x24BDF73B0];

  return v4;
}

id __59__CAMDrawerSharedLibraryButtonAccessibility_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerSharedLibraryButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerSharedLibraryButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
