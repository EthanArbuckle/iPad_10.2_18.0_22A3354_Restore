@implementation SBDynamicFlashlightActivityElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDynamicFlashlightActivityElementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDynamicFlashlightActivityElementViewController"), CFSTR("_torchState"), "{CGPoint=dd}");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDynamicFlashlightActivityElementViewController"), CFSTR("currentIntensity"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDynamicFlashlightActivityElementViewController"), CFSTR("currentWidth"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDynamicFlashlightActivityElementViewController"), CFSTR("_accessibilitySetTorchState:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDynamicFlashlightActivityElementView"), CFSTR("_transitionToExpandedStateWithIntensity:width:"), "v", "d", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDynamicFlashlightActivityElementView"), CFSTR("_transitionToCollapsedState"), "v", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("flashlight"));
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27[4];
  _QWORD v28[4];
  id v29[4];
  _QWORD v30[4];
  id v31[4];
  _QWORD v32[4];
  id v33[4];
  id location;
  _QWORD v35[6];

  v35[4] = *MEMORY[0x24BDAC8D0];
  -[SBDynamicFlashlightActivityElementViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeCGPointForKey:", CFSTR("_torchState"));
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("currentIntensity"));
  v8 = v7;
  objc_msgSend(v2, "safeCGFloatForKey:", CFSTR("currentWidth"));
  v10 = v9;
  objc_initWeak(&location, v2);
  v11 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("increase.flashlight.intensity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke;
  v32[3] = &unk_250367898;
  v33[1] = v8;
  objc_copyWeak(v33, &location);
  v33[2] = v4;
  v33[3] = v6;
  v14 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v32);

  v15 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("decrease.flashlight.intensity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_3;
  v30[3] = &unk_250367898;
  v31[1] = v8;
  objc_copyWeak(v31, &location);
  v31[2] = v4;
  v31[3] = v6;
  v17 = (void *)objc_msgSend(v15, "initWithName:actionHandler:", v16, v30);

  v18 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("increase.flashlight.beamwidth"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_5;
  v28[3] = &unk_250367898;
  v29[1] = v10;
  objc_copyWeak(v29, &location);
  v29[2] = v4;
  v29[3] = v6;
  v20 = (void *)objc_msgSend(v18, "initWithName:actionHandler:", v19, v28);

  v21 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("decrease.flashlight.beamwidth"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_7;
  v26[3] = &unk_250367898;
  v27[1] = v10;
  objc_copyWeak(v27, &location);
  v27[2] = v4;
  v27[3] = v6;
  v23 = (void *)objc_msgSend(v21, "initWithName:actionHandler:", v22, v26);

  v35[0] = v14;
  v35[1] = v17;
  v35[2] = v20;
  v35[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v27);
  objc_destroyWeak(v29);

  objc_destroyWeak(v31);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);

  return v24;
}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v6;
  __int128 v7;
  double v8;

  v3 = a2;
  v4 = fmin(*(double *)(a1 + 40) + 0.25, 1.0);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));

}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v6;
  __int128 v7;
  double v8;

  v3 = a2;
  v4 = fmax(*(double *)(a1 + 40) + -0.25, 0.0);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v7 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));

}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v6[2];
  __int128 v7;

  v3 = a2;
  v4 = fmin(*(double *)(a1 + 40) + 0.25, 1.0);
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = *(id *)&v4;
  v7 = *(_OWORD *)(a1 + 48);
  AXPerformSafeBlock();
  objc_destroyWeak(v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));

}

uint64_t __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v6[2];
  __int128 v7;

  v3 = a2;
  v4 = fmax(*(double *)(a1 + 40) + -0.25, 0.0);
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = *(id *)&v4;
  v7 = *(_OWORD *)(a1 + 48);
  AXPerformSafeBlock();
  objc_destroyWeak(v6);

  return 1;
}

void __81__SBDynamicFlashlightActivityElementViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilitySetTorchState:", *(double *)(a1 + 40), *(double *)(a1 + 56));

}

- (id)accessibilityPath
{
  void *v3;
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  -[SBDynamicFlashlightActivityElementViewAccessibility _accessibilityContainerView](self, "_accessibilityContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityFrame");
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    v26 = CGRectInset(v25, -5.0, -5.0);
    v21 = v26.size.height;
    v9 = v26.origin.x;
    v23 = v26.origin.x;
    v10 = v26.origin.y;
    v11 = v26.size.width;
    v12 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v22 = v12 / CGRectGetWidth(v27);
    v28.origin.x = v9;
    v28.origin.y = v10;
    v28.size.width = v11;
    v28.size.height = v21;
    v13 = CGRectGetHeight(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v14 = v13 / CGRectGetHeight(v29);
    objc_msgSend(v4, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cornerRadius");
    v17 = fmax(v22, v14) * v16;

    objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithArcRoundedRect:cornerRadius:", v23, v10, v11, v21, v17);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
    -[SBDynamicFlashlightActivityElementViewAccessibility accessibilityPath](&v24, sel_accessibilityPath);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;

  return v19;
}

- (id)_accessibilityContainerView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("systemApertureControllerForMainDisplay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_systemApertureViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_orderedContainerViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_transitionToExpandedStateWithIntensity:(double)a3 width:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
  -[SBDynamicFlashlightActivityElementViewAccessibility _transitionToExpandedStateWithIntensity:width:](&v5, sel__transitionToExpandedStateWithIntensity_width_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

- (void)_transitionToCollapsedState
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBDynamicFlashlightActivityElementViewAccessibility;
  -[SBDynamicFlashlightActivityElementViewAccessibility _transitionToCollapsedState](&v2, sel__transitionToCollapsedState);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
