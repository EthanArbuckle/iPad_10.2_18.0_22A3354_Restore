@implementation CAMDynamicShutterControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDynamicShutterControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentDevice"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("isRecording"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_shutterButtonModeForCameraMode:isCapturing:"), "q", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_captureController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("dynamicShutterControlGesturesDidBegin:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("_setShutterState:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("_setDragHandleState:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("_setInnerShapeState:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("_capturingCTMVideoRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("_centerOuterView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("_lockButtonOuterView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_beginCapturingBurst"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_stopCapturingBurst"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("incrementCounter"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("isCapturingBurst"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)_axVC
{
  void *v2;
  void *v3;

  -[CAMDynamicShutterControlAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __46__CAMDynamicShutterControlAccessibility__axVC__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (!-[CAMDynamicShutterControlAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isRecording"));

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14 = MEMORY[0x24BDAC760];
  LOBYTE(v15) = (_BYTE)v4;
  AXPerformSafeBlock();
  v7 = v17[3];
  _Block_object_dispose(&v16, 8);
  v8 = v7 - 1;
  if ((unint64_t)(v7 - 1) < 8 && ((0xE7u >> v8) & 1) != 0)
  {
    v9 = off_24FEE06E0[v8];
  }
  else
  {
    if (v5)
      goto LABEL_5;
    -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC", v14, 3221225472, __59__CAMDynamicShutterControlAccessibility_accessibilityLabel__block_invoke, &unk_24FEE0658, self, &v16, 0, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("_captureController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("_capturingCTMVideoRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
LABEL_5:
      v9 = CFSTR("camera.photo.button.text");
    else
      v9 = CFSTR("camera.video.stop.record.button.text");
  }
  accessibilityCameraKitLocalizedString(v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __59__CAMDynamicShutterControlAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_shutterButtonModeForCameraMode:isCapturing:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

- (id)accessibilityIdentifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  objc_super v9;

  if ((accessibilityIdentifier_CheckingAXElement & 1) != 0
    || (accessibilityIdentifier_CheckingAXElement = 1,
        v3 = -[CAMDynamicShutterControlAccessibility isAccessibilityElement](self, "isAccessibilityElement"),
        accessibilityIdentifier_CheckingAXElement = 0,
        !v3))
  {
    v8 = 0;
  }
  else
  {
    -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_currentMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 < 0xA)
      return off_24FEE0720[v6];
    v9.receiver = self;
    v9.super_class = (Class)CAMDynamicShutterControlAccessibility;
    -[CAMDynamicShutterControlAccessibility accessibilityIdentifier](&v9, sel_accessibilityIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (BOOL)accessibilityActivate
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMDynamicShutterControlAccessibility;
  v2 = -[CAMDynamicShutterControlAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0];
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[CAMDynamicShutterControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_centerOuterView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  -[CAMDynamicShutterControlAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_lockButtonOuterView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAccessibilityLabelBlock:", &__block_literal_global_277);
  objc_msgSend(v2, "_setIsAccessibilityElementBlock:", &__block_literal_global_279_0);
  if (v2 && (objc_msgSend(v2, "isHidden") & 1) == 0)
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke()
{
  return accessibilityCameraKitLocalizedString(CFSTR("camera.photo.button.text"));
}

uint64_t __79__CAMDynamicShutterControlAccessibility__accessibilitySupplementaryFooterViews__block_invoke_2()
{
  return 1;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];

  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUILocalizedString(CFSTR("begin.burst.mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke;
  v32[3] = &unk_24FEE06C0;
  v32[4] = self;
  v6 = (void *)objc_msgSend(v3, "initWithName:actionHandler:", v4, v32);

  v7 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUILocalizedString(CFSTR("stop.burst.mode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v5;
  v31[1] = 3221225472;
  v31[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_3;
  v31[3] = &unk_24FEE06C0;
  v31[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v8, v31);

  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("currentCaptureMode"));

  v12 = (v11 & 0xFFFFFFFFFFFFFFFBLL) == 0
     && -[CAMDynamicShutterControlAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_shutterState")) != 3;
  v13 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUILocalizedString(CFSTR("take.video.action"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_5;
  v30[3] = &unk_24FEE06C0;
  v30[4] = self;
  v15 = (void *)objc_msgSend(v13, "initWithName:actionHandler:", v14, v30);

  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeValueForKey:", CFSTR("_captureController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v17, "safeBoolForKey:", CFSTR("isCapturingBurst"));

  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeValueForKey:", CFSTR("_currentDevice"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  -[CAMDynamicShutterControlAccessibility _axVC](self, "_axVC");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeValueForKey:", CFSTR("_currentMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(MEMORY[0x24BE14A28], "capabilities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isBurstSupportedForMode:device:", v23, v20);

  if ((_DWORD)v14)
    v26 = v9;
  else
    v26 = v6;
  if (!v25)
    v26 = 0;
  if (v12)
    v27 = v15;
  else
    v27 = 0;
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axVC");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_beginCapturingBurst");

}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_3()
{
  AXPerformSafeBlock();
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axVC");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_stopCapturingBurst");

}

uint64_t __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_5()
{
  AXPerformSafeBlock();
  return 1;
}

void __67__CAMDynamicShutterControlAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_axVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicShutterControlGesturesDidBegin:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "_setDragHandleState:animated:", 4, 1);
  objc_msgSend(*(id *)(a1 + 32), "_setInnerShapeState:animated:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "_setShutterState:", 3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], &stru_24FEE0E80);
}

- (int64_t)incrementCounter
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMDynamicShutterControlAccessibility;
  v2 = -[CAMDynamicShutterControlAccessibility incrementCounter](&v7, sel_incrementCounter);
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityCameraUILocalizedString(CFSTR("camera.photo.burst.count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakIfNotSpeaking();
  return (int64_t)v2;
}

@end
