@implementation CAMDrawerVideoStabilizationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDrawerVideoStabilizationButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerVideoStabilizationButton"), CFSTR("videoStabilizationMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDrawerVideoStabilizationButton"), CFSTR("setVideoStabilizationMode:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_itemLabels"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("_cachedMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerVideoStabilizationButton"), CFSTR("CAMControlDrawerButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMControlDrawerMenuItem"), CFSTR("value"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDrawerVideoStabilizationButton"), CFSTR("CAMControlDrawerMenuButton"));

}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CAMDrawerVideoStabilizationButtonAccessibility *v11;
  _BOOL8 v12;

  if (AXRequestingClient() == 3)
  {
    -[CAMDrawerVideoStabilizationButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoStabilizationMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __71__CAMDrawerVideoStabilizationButtonAccessibility_accessibilityActivate__block_invoke;
    v10 = &unk_24FEE0098;
    v11 = self;
    v12 = v4 == 0;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
    return -[CAMDrawerVideoStabilizationButtonAccessibility accessibilityActivate](&v6, sel_accessibilityActivate);
  }
}

void __71__CAMDrawerVideoStabilizationButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setVideoStabilizationMode:animated:", *(_QWORD *)(a1 + 40), 0);
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  return accessibilityCameraUI2LocalizedString(CFSTR("Action_Mode_Hint"));
}

- (id)accessibilityIdentifier
{
  return CFSTR("ActionMode");
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI2LocalizedString(CFSTR("Action_Mode"));
}

- (id)accessibilityValue
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  -[CAMDrawerVideoStabilizationButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoStabilizationMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      return v5;
    }
    v4 = CFSTR("Action_Mode_On");
  }
  else
  {
    v4 = CFSTR("Action_Mode_Off");
  }
  accessibilityCameraUI2LocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  _QWORD v5[5];
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
  -[CAMDrawerVideoStabilizationButtonAccessibility layoutSubviews](&v7, sel_layoutSubviews);
  -[CAMDrawerVideoStabilizationButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_itemLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  -[CAMDrawerVideoStabilizationButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_cachedMenuItems"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_24FEE0198;
  v4[4] = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);
  _Block_object_dispose(v5, 8);

}

void __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("value"));

    if (v7)
    {
      if (v7 != 1)
      {
        v9 = 0;
        goto LABEL_8;
      }
      v8 = CFSTR("Action_Mode_On");
    }
    else
    {
      v8 = CFSTR("Action_Mode_Off");
    }
    accessibilityCameraUI2LocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke_2;
    v11[3] = &unk_24FEE00E8;
    v12 = v9;
    v10 = v9;
    objc_msgSend(v5, "_setAccessibilityValueBlock:", v11);

  }
}

id __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDrawerVideoStabilizationButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
