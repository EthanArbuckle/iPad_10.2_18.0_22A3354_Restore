@implementation CAMFlashButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFlashButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashButton"), CFSTR("setFlashMode:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashButton"), CFSTR("flashMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMExpandableMenuButton"), CFSTR("startExpansionWithProposedFrame:"), "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMFlashButton"), CFSTR("CAMExpandableMenuButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashButton"), CFSTR("modeForIndex:"), "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashButton"), CFSTR("isUnavailable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFlashButton"), CFSTR("titleForMenuItemAtIndex:"), "@", "q", 0);

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
  CAMFlashButtonAccessibility *v12;
  uint64_t v13;

  if (AXRequestingClient() == 3)
  {
    -[CAMFlashButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

    v5 = v4 != 1;
    if (!v4)
      v5 = 2;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __52__CAMFlashButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_24FEE0098;
    v12 = self;
    v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMFlashButtonAccessibility;
    return -[CAMFlashButtonAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
  }
}

void __52__CAMFlashButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "setFlashMode:", *(_QWORD *)(a1 + 40));
  __UIAccessibilitySafeClass();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sendActionsForControlEvents:", 4096);

}

- (id)accessibilityHint
{
  if ((-[CAMFlashButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUnavailable")) & 1) != 0)
    return 0;
  accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_HINT"));
  return (id)objc_claimAutoreleasedReturnValue();
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
  __CFString *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  if ((-[CAMFlashButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isUnavailable")) & 1) != 0)
  {
    v3 = CFSTR("FLASH_MODE_BUTTON_UNAVAILABLE");
  }
  else
  {
    -[CAMFlashButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("flashMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v6 = CFSTR("FLASH_MODE_BUTTON_VALUE_AUTO");
    if (v5 == 1)
      v6 = CFSTR("FLASH_MODE_BUTTON_VALUE_ON");
    if (v5)
      v3 = (__CFString *)v6;
    else
      v3 = CFSTR("FLASH_MODE_BUTTON_VALUE_OFF");
  }
  accessibilityCameraKitLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startExpansionWithProposedFrame:(CGRect)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMFlashButtonAccessibility;
  -[CAMFlashButtonAccessibility startExpansionWithProposedFrame:](&v6, sel_startExpansionWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  -[CAMFlashButtonAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_menuItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke;
  v5[3] = &unk_24FEE0870;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v5 = a2;
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = MEMORY[0x24BDAC760];
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2;
  v24 = &unk_24FEE07C0;
  v25 = *(_QWORD *)(a1 + 32);
  v26 = &v15;
  v27 = a3;
  AXPerformSafeBlock();
  v7 = v16[3];
  _Block_object_dispose(&v15, 8);
  v8 = &__block_literal_global_10;
  if (v7 == 1)
    v8 = &__block_literal_global_240;
  if (v7 == 2)
    v9 = &__block_literal_global_241;
  else
    v9 = v8;
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", v9);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = a3;
  AXPerformSafeBlock();
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  if (objc_msgSend(v10, "length", v6, 3221225472, __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_242, &unk_24FEE07C0, v13, &v15, v14))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axSafelyAddObject:", v10);
    objc_msgSend(v5, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axSafelyAddObject:", v12);

    objc_msgSend(v5, "setAccessibilityUserInputLabels:", v11);
  }

}

uint64_t __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "modeForIndex:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_3()
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_VALUE_OFF"));
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_4()
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_VALUE_ON"));
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_5()
{
  return accessibilityCameraKitLocalizedString(CFSTR("FLASH_MODE_BUTTON_VALUE_AUTO"));
}

void __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_242(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "titleForMenuItemAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMFlashButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMFlashButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
