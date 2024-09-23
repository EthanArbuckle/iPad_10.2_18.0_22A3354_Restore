@implementation CAMModeDialAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMModeDial");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDial"), CFSTR("setSelectedMode: animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDial"), CFSTR("selectedMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDial"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDial"), CFSTR("_items"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDialItem"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMFullscreenViewfinder"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("setControlDrawerExpanded:forReason:animated:"), "v", "B", "q", "B", 0);

}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("mode.button.text"));
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;
  CGRect result;

  if (AXDeviceIsPad())
  {
    -[CAMModeDialAccessibility bounds](self, "bounds");
    v6.origin.y = v3 + 60.0;
    v6.size.height = v4 + -120.0;
    return UIAccessibilityConvertFrameToScreenCoordinates(v6, (UIView *)self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMModeDialAccessibility;
    -[CAMModeDialAccessibility accessibilityFrame](&v5, sel_accessibilityFrame);
  }
  return result;
}

- (id)accessibilityIdentifier
{
  return CFSTR("CameraMode");
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMModeDialAccessibility;
  -[CAMModeDialAccessibility setSelectedMode:animated:](&v4, sel_setSelectedMode_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_axCurrentCameraMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[CAMModeDialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unsignedIntegerValue");

  -[CAMModeDialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  v11 = v5;
  AXPerformSafeBlock();
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_24FEE0E80);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __48__CAMModeDialAccessibility__axCurrentCameraMode__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_axAdjustValue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  -[CAMModeDialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsignedIntegerValue");

  LOBYTE(v16) = 0;
  -[CAMModeDialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v8 = v7;
  AXPerformSafeBlock();
  v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  if (v3)
  {
    LOBYTE(v16) = 0;
    -[CAMModeDialAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_modes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v16)
      abort();
    v12 = objc_msgSend(v11, "count");

    if (v12 - 1 >= v9 + 1)
      v13 = v9 + 1;
    else
      v13 = v12 - 1;
  }
  else
  {
    if (v9 <= 1)
      v14 = 1;
    else
      v14 = v9;
    v13 = v14 - 1;
  }
  objc_msgSend(v8, "objectAtIndex:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "integerValue");

  AXPerformSafeBlock();
}

void __43__CAMModeDialAccessibility__axAdjustValue___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v2, "indexOfObject:", v3);

}

void __43__CAMModeDialAccessibility__axAdjustValue___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSelectedMode:animated:", *(_QWORD *)(a1 + 40), 1);
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
  objc_msgSend(*(id *)(a1 + 32), "_axCurrentCameraMode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)accessibilityDecrement
{
  -[CAMModeDialAccessibility _axAdjustValue:](self, "_axAdjustValue:", 0);
}

- (void)accessibilityIncrement
{
  -[CAMModeDialAccessibility _axAdjustValue:](self, "_axAdjustValue:", 1);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[CAMModeDialAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, v3);
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityCameraUILocalizedString(CFSTR("camera.controls.show"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_2;
    v10[3] = &unk_24FEDFF80;
    objc_copyWeak(&v11, &location);
    v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, v10);

    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CAMModeDialAccessibility;
    -[CAMModeDialAccessibility accessibilityCustomActions](&v9, sel_accessibilityCustomActions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2348BFB60](CFSTR("CAMFullscreenViewfinder"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __54__CAMModeDialAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setControlDrawerExpanded:forReason:animated:", 1, 4, 1);

}

@end
