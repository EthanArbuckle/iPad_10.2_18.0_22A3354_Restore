@implementation CAMFullscreenViewfinderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMFullscreenViewfinder");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("setControlDrawerExpanded:forReason:animated:"), "v", "B", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("controlDrawer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("_handleDirectionIndicatorTapped"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("isControlDrawerExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("setImageAnalysisButtonVisible:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("imageAnalysisButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("setVisiblePreviewSuggestionButton:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("_loadSmartStyleControlsIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleSmartStylePadValueChanged:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentSmartStyle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("smartStyleSlider2D"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("smartStyleIntensitySlider"), "@", 0);

}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  -[CAMFullscreenViewfinderAccessibility setControlDrawerExpanded:forReason:animated:](&v9, sel_setControlDrawerExpanded_forReason_animated_, a3, a4, a5);
  if (v5)
  {
    v7 = *MEMORY[0x24BDF7328];
    -[CAMFullscreenViewfinderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("controlDrawer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

  }
}

- (BOOL)accessibilityPerformEscape
{
  int v2;

  v2 = -[CAMFullscreenViewfinderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isControlDrawerExpanded"));
  if (v2)
    AXPerformSafeBlock();
  return v2;
}

uint64_t __66__CAMFullscreenViewfinderAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDirectionIndicatorTapped");
}

- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  -[CAMFullscreenViewfinderAccessibility setImageAnalysisButtonVisible:animated:](&v12, sel_setImageAnalysisButtonVisible_animated_, a3, a4);
  if (v4)
  {
    -[CAMFullscreenViewfinderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageAnalysisButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("mode"));
    if (v7 == 2)
    {
      v9 = CFSTR("appclip.detected");
    }
    else
    {
      v8 = v7;
      if (v7 == 1)
      {
        v9 = CFSTR("qrcode.detected");
      }
      else
      {
        if (v7)
        {
          AXLogAppAccessibility();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[CAMFullscreenViewfinderAccessibility setImageAnalysisButtonVisible:animated:].cold.1(v8, v11);

          v10 = 0;
          goto LABEL_12;
        }
        v9 = CFSTR("text.detected");
      }
    }
    accessibilityCameraUILocalizedString(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    UIAccessibilitySpeakIfNotSpeaking();

  }
}

- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  -[CAMFullscreenViewfinderAccessibility setVisiblePreviewSuggestionButton:animated:](&v7, sel_setVisiblePreviewSuggestionButton_animated_, a3, a4);
  if (a3 == 1)
  {
    if (-[CAMFullscreenViewfinderAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowControls")))
    {
      accessibilityCameraUILocalizedString(CFSTR("auto.macro.mode.detected"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakIfNotSpeaking();

    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *);
  void *v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  __int128 v28;
  _QWORD v29[4];
  __int128 v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  -[CAMFullscreenViewfinderAccessibility _accessibilityLoadAccessibilityInformation](&v31, sel__accessibilityLoadAccessibilityInformation);
  -[CAMFullscreenViewfinderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("smartStyleSlider2D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", &__block_literal_global_12);
  -[CAMFullscreenViewfinderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_253, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentSmartStyle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3010000000;
  v29[3] = &unk_230B5980A;
  v30 = *MEMORY[0x24BDBEFB0];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3010000000;
  v27[3] = &unk_230B5980A;
  v8 = MEMORY[0x24BDAC760];
  v28 = v30;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v23 = &unk_24FEE08F8;
  v25 = v29;
  v9 = v7;
  v24 = v9;
  v26 = v27;
  AXPerformSafeBlock();
  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityCameraUI3LocalizedString(CFSTR("tone.and.color.string"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatFloatWithPercentage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v18[3] = &unk_24FEE00E8;
    v15 = v14;
    v19 = v15;
    objc_msgSend(v4, "_setAccessibilityLabelBlock:", v18);

  }
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v17[3] = &unk_24FEE0948;
  v17[4] = self;
  v17[5] = v29;
  objc_msgSend(v4, "_setAccessibilityCustomActionsBlock:", v17);
  objc_msgSend(v4, "_setAccessibilityTraitsBlock:", &__block_literal_global_276);
  objc_msgSend(v4, "_setAccessibilityActivationPointBlock:", &__block_literal_global_278);
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", &__block_literal_global_279_1);
  -[CAMFullscreenViewfinderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("smartStyleIntensitySlider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setAccessibilityLabelBlock:", &__block_literal_global_280);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x24BE14A70], "slider2DValueForStyle:limitRangeForSystemStyles:", a1[4], 0);
  v2 = *(_QWORD *)(a1[5] + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  result = objc_msgSend(MEMORY[0x24BE14A70], "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 0, *(double *)(*(_QWORD *)(a1[5] + 8) + 32), *(double *)(*(_QWORD *)(a1[5] + 8) + 40));
  v6 = *(_QWORD *)(a1[6] + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  return result;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4()
{
  return __UIAXStringForVariables();
}

id __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  __int128 v18;
  _QWORD v19[4];
  __int128 v20;
  _QWORD v21[4];
  __int128 v22;
  _QWORD v23[4];
  __int128 v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUI3LocalizedString(CFSTR("increment.color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6;
  v23[3] = &unk_24FEE0920;
  v24 = *(_OWORD *)(a1 + 32);
  v5 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, v23);

  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUI3LocalizedString(CFSTR("decrement.color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v21[3] = &unk_24FEE0920;
  v22 = *(_OWORD *)(a1 + 32);
  v8 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, v21);

  v9 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUI3LocalizedString(CFSTR("increment.tone"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8;
  v19[3] = &unk_24FEE0920;
  v20 = *(_OWORD *)(a1 + 32);
  v11 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v10, v19);

  v12 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityCameraUI3LocalizedString(CFSTR("decrement.tone"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9;
  v17[3] = &unk_24FEE0920;
  v18 = *(_OWORD *)(a1 + 32);
  v14 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v13, v17);

  v25[0] = v5;
  v25[1] = v8;
  v25[2] = v11;
  v25[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "axUpdateSliderValue:smartSliderType:increment:", 0, 1, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "axUpdateSliderValue:smartSliderType:increment:", 0, 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "axUpdateSliderValue:smartSliderType:increment:", 1, 1, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_9(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "axUpdateSliderValue:smartSliderType:increment:", 1, 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return 1;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_10()
{
  return *MEMORY[0x24BDF7410];
}

double __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_11()
{
  return -1.0;
}

uint64_t __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_12()
{
  return 1;
}

id __82__CAMFullscreenViewfinderAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_13()
{
  return accessibilityCameraUI3LocalizedString(CFSTR("smart.style.palette.slider"));
}

- (void)_loadSmartStyleControlsIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMFullscreenViewfinderAccessibility;
  -[CAMFullscreenViewfinderAccessibility _loadSmartStyleControlsIfNeeded](&v3, sel__loadSmartStyleControlsIfNeeded);
  -[CAMFullscreenViewfinderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)axUpdateSliderValue:(CGPoint)a3 smartSliderType:(int64_t)a4 increment:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  void *v11;
  __int128 *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  __int128 v16;
  char v17;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  -[CAMFullscreenViewfinderAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_285_0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (__int128 *)MEMORY[0x24BDBEFB0];
  v17 = 0;
  if (a4)
  {
    if (a4 == 1)
      -[CAMFullscreenViewfinderAccessibility _axChangeValue:increment:borderHit:](self, "_axChangeValue:increment:borderHit:", v5, &v17, y);
  }
  else
  {
    -[CAMFullscreenViewfinderAccessibility _axChangeValue:increment:borderHit:](self, "_axChangeValue:increment:borderHit:", v5, &v17, x);
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3010000000;
  v15[3] = &unk_230B5980A;
  v16 = *v12;
  v13 = v11;
  AXPerformSafeBlock();
  if (v17)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDC0]);
  if ((unint64_t)a4 <= 1)
  {
    AXFormatFloatWithPercentage();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeak();

  }
  _Block_object_dispose(v15, 8);

}

uint64_t __86__CAMFullscreenViewfinderAccessibility_axUpdateSliderValue_smartSliderType_increment___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __86__CAMFullscreenViewfinderAccessibility_axUpdateSliderValue_smartSliderType_increment___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BE14A70], "colorAndToneBiasForSlider2DValue:limitRangeForSystemStyles:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  return objc_msgSend(*(id *)(a1 + 32), "_handleSmartStylePadValueChanged:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (double)_axChangeValue:(double)a3 increment:(BOOL)a4 borderHit:(BOOL *)a5
{
  double v5;
  double result;
  double v7;

  v5 = -0.1;
  if (a4)
    v5 = 0.1;
  result = v5 + a3;
  v7 = 1.0;
  if (result >= 1.0 || (v7 = -1.0, result <= -1.0))
  {
    *a5 = 1;
    return v7;
  }
  return result;
}

- (void)setImageAnalysisButtonVisible:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_230B33000, a2, OS_LOG_TYPE_ERROR, "VKImageAnalysisButtonMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

@end
