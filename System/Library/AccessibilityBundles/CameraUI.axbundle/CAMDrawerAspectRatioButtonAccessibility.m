@implementation CAMDrawerAspectRatioButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerAspectRatioButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerAspectRatioButton"), CFSTR("aspectRatio"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerAspectRatioButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerAspectRatioButton"), CFSTR("CAMControlDrawerMenuButton"));

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
  CAMDrawerAspectRatioButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    -[CAMDrawerAspectRatioButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("aspectRatio"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = 2 * (v4 == 1);
    if (!v4)
      v5 = 1;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __64__CAMDrawerAspectRatioButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    v12 = self;
    v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
    return -[CAMDrawerAspectRatioButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __64__CAMDrawerAspectRatioButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setAspectRatio:", *(_QWORD *)(a1 + 40));
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(CFSTR("ASPECT_RATIO_BUTTON_HINT"));
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("ASPECT_RATIO_BUTTON_LABEL"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("AspectRatioButton");
}

- (id)accessibilityValue
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[CAMDrawerAspectRatioButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("aspectRatio"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityCameraUILocalizedString(off_24FEE0598[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
  -[CAMDrawerAspectRatioButtonAccessibility layoutSubviews](&v7, sel_layoutSubviews);
  -[CAMDrawerAspectRatioButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  -[CAMDrawerAspectRatioButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0198;
  v4[4] = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  _Block_object_dispose(v5, 8);

}

void __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  unint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setIsAccessibilityElement:", 1);
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("value"));

    if (v6 <= 2)
      objc_msgSend(v7, "_setAccessibilityLabelBlock:", *(&off_24FEE05B0 + v6));
  }

}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_2()
{
  return accessibilityCameraUILocalizedString(CFSTR("ASPECT_RATIO_BUTTON_VALUE_4_3"));
}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_3()
{
  return accessibilityCameraUILocalizedString(CFSTR("ASPECT_RATIO_BUTTON_VALUE_SQUARE"));
}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_4()
{
  return accessibilityCameraUILocalizedString(CFSTR("ASPECT_RATIO_BUTTON_VALUE_16_9"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerAspectRatioButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
