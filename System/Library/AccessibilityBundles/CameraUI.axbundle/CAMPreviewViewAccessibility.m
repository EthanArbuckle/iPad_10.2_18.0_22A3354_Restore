@implementation CAMPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPreviewView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CAMPreviewView"), CFSTR("_indicatorContainerView"), "CAMInterfaceModulationView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewView"), CFSTR("videoPreviewView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewView"), CFSTR("videoPreviewLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMViewfinderViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMShallowDepthOfFieldBadge"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMPortraitModeInstructionLabel"));
  objc_msgSend(v3, "validateClass:", CFSTR("CAMFullscreenViewfinder"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_cachedVideoZoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentMaximumZoomFactor"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_setCachedVideoZoomFactor:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_updateZoomUIWithZoomFactor: animated:"), "v", "d", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("changeToVideoZoomFactor:graphConfiguration:"), "v", "d", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentGraphConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderView"), CFSTR("bottomBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderView"), CFSTR("shallowDepthOfFieldBadge"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderView"), CFSTR("portraitModeInstructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMFullscreenViewfinder"), CFSTR("modeDial"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMModeDial"), CFSTR("selectedMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_shallowDepthOfFieldStatus"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_targetPortraitModeInstructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMInstructionLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_captureController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMPortraitModeInstructionLabel"), CFSTR("CAMInstructionLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("isCapturingVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUCaptureController"), CFSTR("isCapturingStandardVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewView"), CFSTR("viewportFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_zoomControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_buttonPlatter"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomButtonPlatter"), CFSTR("_platterBackgroundView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_modeDial"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_primaryShutterControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomControl"), CFSTR("_zoomDial"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMZoomDial"), CFSTR("_contentMaskView"), "@", 0);

}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("viewfinder.label.text"));
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v6;

  if (-[CAMPreviewViewAccessibility _axIsBackFacing](self, "_axIsBackFacing"))
  {
    accessibilityCameraKitLocalizedString(CFSTR("viewfinder.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CAMPreviewViewAccessibility _axIsFocusLocked](self, "_axIsFocusLocked"))
    {
      accessibilityCameraKitLocalizedString(CFSTR("viewfinder.hint.focus-locked"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __UIAXStringForVariables();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    accessibilityCameraKitLocalizedString(CFSTR("viewfinder.hint.focus-locked"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_axIsPortraitMode
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CAMPreviewViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMFullscreenViewfinder"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("modeDial"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMModeDial"));
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "safeIntegerForKey:", CFSTR("selectedMode")) == 6;

  return v4;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;

  if (-[CAMPreviewViewAccessibility _axIsPortraitMode](self, "_axIsPortraitMode"))
  {
    -[CAMPreviewViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMFullscreenViewfinder")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController")), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((objc_msgSend(v5, "safeIntegerForKey:", CFSTR("_shallowDepthOfFieldStatus")) & 0xFFFFFFFFFFFFFFF7) == 1)
      {
        accessibilityCameraUILocalizedString(CFSTR("depth.enabled"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("_targetPortraitModeInstructionLabel.text"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        accessibilityCameraUILocalizedString(CFSTR("depth.disabled"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v17 = CFSTR("__AXStringForVariablesSentinel");
        __AXStringForVariables();
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  if (-[CAMPreviewViewAccessibility _axIsBackFacing](self, "_axIsBackFacing", v14, v17))
  {
    if (-[CAMPreviewViewAccessibility _axIsFocusLocked](self, "_axIsFocusLocked"))
      v7 = CFSTR("focus.value.locked");
    else
      v7 = CFSTR("focus.value.unlocked");
    accessibilityCameraKitLocalizedString(v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (-[CAMPreviewViewAccessibility _axIsUsingFlash](self, "_axIsUsingFlash", v15, v18))
  {
    accessibilityCameraUILocalizedString(CFSTR("flash.enabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDFEFE8];
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  -[CAMPreviewViewAccessibility _accessibilityZoomIn:](self, "_accessibilityZoomIn:", 1, a3.x, a3.y);
  return 1;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  -[CAMPreviewViewAccessibility _accessibilityZoomIn:](self, "_accessibilityZoomIn:", 0, a3.x, a3.y);
  return 1;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[CAMPreviewViewAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (void)_showFocusAtPoint:(CGPoint)a3 startAnimating:(BOOL)a4
{
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMPreviewViewAccessibility;
  -[CAMPreviewViewAccessibility _showFocusAtPoint:startAnimating:](&v13, sel__showFocusAtPoint_startAnimating_, a4, a3.x, a3.y);
  -[CAMPreviewViewAccessibility window](self, "window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CAMPreviewViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_continuousAutoFocusView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CAMPreviewViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_focusView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        goto LABEL_9;
    }
    v9 = CFAbsoluteTimeGetCurrent() - *(double *)&_showFocusAtPoint_startAnimating__LastOutputTime;
    if (v8)

    else
    if (v9 > 10.0)
    {
      v10 = (void *)MEMORY[0x24BDFEA60];
      accessibilityCameraKitLocalizedString(CFSTR("auto.focused"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "axAttributedStringWithString:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAttribute:forKey:", v12, *MEMORY[0x24BDFEAD8]);

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
      _showFocusAtPoint_startAnimating__LastOutputTime = CFAbsoluteTimeGetCurrent();
LABEL_9:

    }
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewAccessibility;
  -[CAMPreviewViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CAMPreviewViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_indicatorContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 0);

}

- (CAMPreviewViewAccessibility)initWithFrame:(CGRect)a3
{
  CAMPreviewViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewAccessibility;
  v3 = -[CAMPreviewViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CAMPreviewViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

- (void)_accessibilityZoomIn:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  -[CAMPreviewViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMViewfinderView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeCGFloatForKey:", CFSTR("_cachedVideoZoomFactor"));
  objc_msgSend(v6, "safeCGFloatForKey:", CFSTR("_currentMaximumZoomFactor"));
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentGraphConfiguration"));
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v6;
  AXPerformSafeBlock();
  AXPerformSafeBlock();

}

void __52__CAMPreviewViewAccessibility__accessibilityZoomIn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_setCachedVideoZoomFactor:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_updateZoomUIWithZoomFactor:animated:", 1, *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_captureController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "changeToVideoZoomFactor:graphConfiguration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

void __52__CAMPreviewViewAccessibility__accessibilityZoomIn___block_invoke_2()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF71E8];
  AXFormatMagnificationFactor();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (BOOL)_axIsFocusLocked
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[CAMPreviewViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCameraIsFocusedKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)_axIsBackFacing
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[CAMPreviewViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXIsBackCamera"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (BOOL)_axIsUsingFlash
{
  return -[CAMPreviewViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXCameraWillUseFlashKey"));
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  objc_super v11;
  char v12;

  -[CAMPreviewViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2348BFB60](CFSTR("CAMFullscreenViewfinder"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_captureController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isCapturingVideo")) & 1) != 0
    || (objc_msgSend(v8, "safeBoolForKey:", CFSTR("isCapturingStandardVideo")) & 1) != 0
    || !-[CAMPreviewViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMPreviewViewAccessibility;
    v9 = -[CAMPreviewViewAccessibility _accessibilityMediaAnalysisOptions](&v11, sel__accessibilityMediaAnalysisOptions) | 0x40000;
  }

  return v9;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  -[CAMPreviewViewAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("viewportFrame"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (AXDeviceIsPhone())
  {
    -[CAMPreviewViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_accessibilityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "safeIntegerForKey:", CFSTR("_currentMode"));
    if (v13 == 6)
    {
      v14 = CFSTR("_zoomControl._zoomDial._contentMaskView");
    }
    else
    {
      v14 = CFSTR("_zoomControl._buttonPlatter._platterBackgroundView");
      if (v13)
      {
        objc_msgSend(v12, "safeValueForKeyPath:", CFSTR("_zoomControl._buttonPlatter._platterBackgroundView"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "accessibilityFrame");
        v17 = v16;

        objc_msgSend(v12, "safeValueForKey:", CFSTR("_modeDial"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "accessibilityFrame");
        v20 = v19;

        objc_msgSend(v12, "safeValueForKey:", CFSTR("_primaryShutterControl"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "accessibilityFrame");
        v23 = v22;

        v10 = v10 - v17 - v20 - v23;
LABEL_7:

        goto LABEL_8;
      }
    }
    objc_msgSend(v12, "safeValueForKeyPath:", v14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityFrame");
    v26 = v25;

    v10 = v10 - v26;
    goto LABEL_7;
  }
LABEL_8:
  v27 = v4;
  v28 = v6;
  v29 = v8;
  v30 = v10;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

uint64_t __49__CAMPreviewViewAccessibility_accessibilityFrame__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348BFB60](CFSTR("CAMViewfinderViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
