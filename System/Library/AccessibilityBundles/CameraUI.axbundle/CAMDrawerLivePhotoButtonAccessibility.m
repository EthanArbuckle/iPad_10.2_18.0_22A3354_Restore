@implementation CAMDrawerLivePhotoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerLivePhotoButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerLivePhotoButton"), CFSTR("livePhotoMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerLivePhotoButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerLivePhotoButton"), CFSTR("CAMControlDrawerMenuButton"));

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
  CAMDrawerLivePhotoButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    -[CAMDrawerLivePhotoButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("livePhotoMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = 2 * (v4 != 1);
    if (v4 == 2)
      v5 = 1;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __62__CAMDrawerLivePhotoButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    v12 = self;
    v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
    return -[CAMDrawerLivePhotoButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __62__CAMDrawerLivePhotoButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoMode:", *(_QWORD *)(a1 + 40));
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(CFSTR("LIVEPHOTO_MODE_BUTTON_HINT"));
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("LIVEPHOTO_MODE_BUTTON_LABEL"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("LivePhotoButton");
}

- (id)accessibilityValue
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[CAMDrawerLivePhotoButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("livePhotoMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 > 2)
  {
    v4 = 0;
  }
  else
  {
    accessibilityCameraUILocalizedString(off_24FEE05F8[v3]);
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
  v7.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
  -[CAMDrawerLivePhotoButtonAccessibility layoutSubviews](&v7, sel_layoutSubviews);
  -[CAMDrawerLivePhotoButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__5;
  v5[4] = __Block_byref_object_dispose__5;
  -[CAMDrawerLivePhotoButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0198;
  v4[4] = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  _Block_object_dispose(v5, 8);

}

void __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("value"));

    if (v7 > 2)
    {
      v8 = 0;
    }
    else
    {
      accessibilityCameraUILocalizedString(off_24FEE05F8[v7]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke_2;
    v10[3] = &unk_24FEE00E8;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v10);

  }
}

id __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke_2()
{
  void *v0;
  void *v1;

  accessibilityCameraUILocalizedString(CFSTR("LIVEPHOTO_MODE_BUTTON_LABEL"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerLivePhotoButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
