@implementation FMMapDragRadiusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FMMapDragRadiusView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("handleImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("initialize"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("isDragging"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("isMinimum"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("isMaximum"), "B", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("FMMapDragRadiusViewDelegate"), CFSTR("willStartDraggingHandle:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("FMMapDragRadiusViewDelegate"), CFSTR("didStopDraggingHandle:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("setIsDragging:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("setIsMaximum:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("setIsMinimum:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("currentHandleDistance"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("currentHandleDistanceNormalized"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("popAnimateHandle"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("_axSetCustomRadius:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("minPoint"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("maxPoint"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("usesMetric"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("maximumRadiusNormalized"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FMMapDragRadiusView"), CFSTR("minimumRadiusNormalized"), "d", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMMapDragRadiusViewAccessibility;
  -[FMMapDragRadiusViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[FMMapDragRadiusViewAccessibility _axInitialHandleState](self, "_axInitialHandleState");
  -[FMMapDragRadiusViewAccessibility _axSetUpHandleImageView](self, "_axSetUpHandleImageView");
}

- (void)_axInitialHandleState
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  LOBYTE(v7[0]) = 0;
  objc_opt_class();
  -[FMMapDragRadiusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handleImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "frame");
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3010000000;
  v7[3] = &unk_232612045;
  v8 = *MEMORY[0x24BDBEFB0];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3010000000;
  v5[3] = &unk_232612045;
  v6 = v8;
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v7, 8);

}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "maxPoint");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "minPoint");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v8;
  return result;
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMaximum:", 1);
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMaximum:", 0);
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMinimum:", 1);
}

uint64_t __57__FMMapDragRadiusViewAccessibility__axInitialHandleState__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsMinimum:", 0);
}

- (void)initialize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMMapDragRadiusViewAccessibility;
  -[FMMapDragRadiusViewAccessibility initialize](&v3, sel_initialize);
  -[FMMapDragRadiusViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axSetUpHandleImageView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id from;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  -[FMMapDragRadiusViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("handleImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  accessibilityLocalizedString(CFSTR("location.range.handle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0] | v6);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke;
  v16[3] = &unk_25020CDC8;
  objc_copyWeak(&v17, &from);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_3;
  v14[3] = &unk_25020CDC8;
  objc_copyWeak(&v15, &from);
  objc_msgSend(v4, "_setAccessibilityHintBlock:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_4;
  v11[3] = &unk_25020CDF0;
  objc_copyWeak(&v12, &from);
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "_setAccessibilityIncrementBlock:", v11);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_8;
  v8[3] = &unk_25020CDF0;
  objc_copyWeak(&v9, &from);
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "_setAccessibilityDecrementBlock:", v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

id __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  int v3;
  id v4;
  int v5;
  double v6;
  _QWORD *v7;
  double v8;
  unint64_t v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  _QWORD v22[4];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isMinimum"));

  v4 = objc_loadWeakRetained(v1);
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isMaximum"));

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0x10000000000000;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0x7FEFFFFFFFFFFFFFLL;
  objc_copyWeak(&v16, v1);
  AXPerformSafeBlock();
  if (v5)
  {
    v6 = v18[3];
  }
  else
  {
    v7 = v22;
    if (v3)
      v7 = v21;
    v8 = *(double *)(v7[1] + 24);
    v6 = v18[3];
    if (v6 > (double)(unint64_t)v8)
    {
      v9 = (unint64_t)v8;
      goto LABEL_8;
    }
  }
  v9 = (unint64_t)v6;
LABEL_8:
  v10 = objc_loadWeakRetained(v1);
  v11 = objc_msgSend(v10, "usesMetric");

  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
    accessibilityLocalizedString(CFSTR("distance.in.meters"));
  else
    accessibilityLocalizedString(CFSTR("distance.in.feet"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v16);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  return v14;
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "minimumRadiusNormalized");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "maximumRadiusNormalized");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "currentHandleDistanceNormalized");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

}

id __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  __CFString *v4;
  id v5;
  int v6;
  void *v7;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isMinimum"));

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("distance.minimum.reached");
  }
  else
  {
    v5 = objc_loadWeakRetained(v1);
    v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isMaximum"));

    if (!v6)
    {
      v7 = 0;
      return v7;
    }
    v4 = CFSTR("distance.maximum.reached");
  }
  accessibilityLocalizedString(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_opt_class();
  v5 = objc_loadWeakRetained(v2);
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_copyWeak(&v9, v2);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v6;
  v8 = v4;
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_5(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  id v27;
  char v28;
  double v29;
  id v30;
  double v31;
  id v32;
  dispatch_time_t v33;
  uint64_t v34;
  NSObject *v35;
  dispatch_time_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id from;
  _QWORD block[4];
  id v43;
  id v44;
  id location;
  CGRect v46;
  CGRect v47;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setIsDragging:", 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setIsMaximum:", 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setIsMinimum:", 0);

  v6 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v6, "setHighlighted:", 1);

  objc_msgSend(a1[4], "setNeedsDisplay");
  v7 = a1[5];
  NSProtocolFromString(CFSTR("FMMapDragRadiusViewDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "conformsToProtocol:", v8);

  if ((_DWORD)v7)
  {
    v9 = a1[5];
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "willStartDraggingHandle:", v10);

  }
  v11 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v16 = v13 + 3.0;
  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "maxPoint");
  v19 = v18;

  if (v16 > v19)
  {
    v20 = objc_loadWeakRetained(v2);
    objc_msgSend(v20, "setIsMaximum:", 1);

    accessibilityLocalizedString(CFSTR("distance.maximum.reached"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakOrQueueIfNeeded();

    v16 = v19;
  }
  v46.size.width = 24.0;
  v46.size.height = 24.0;
  v46.origin.x = v16;
  v46.origin.y = v15;
  v47 = CGRectIntegral(v46);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v26 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  objc_msgSend(a1[4], "setNeedsDisplay");
  v27 = objc_loadWeakRetained(v2);
  v28 = objc_msgSend(v27, "safeBoolForKey:", CFSTR("isMaximum"));

  if ((v28 & 1) != 0)
  {
    v29 = 241401.0;
  }
  else
  {
    v30 = objc_loadWeakRetained(v2);
    objc_msgSend(v30, "currentHandleDistance");
    v29 = v31;

  }
  v32 = objc_loadWeakRetained(v2);
  objc_msgSend(v32, "_axSetCustomRadius:", v29);

  objc_initWeak(&location, a1[4]);
  v33 = dispatch_time(0, 50000000);
  v34 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_6;
  block[3] = &unk_25020CDF0;
  objc_copyWeak(&v43, v2);
  objc_copyWeak(&v44, &location);
  v35 = MEMORY[0x24BDAC9B8];
  dispatch_after(v33, MEMORY[0x24BDAC9B8], block);
  objc_initWeak(&from, a1[5]);
  v36 = dispatch_time(0, 300000000);
  v37[0] = v34;
  v37[1] = 3221225472;
  v37[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_7;
  v37[3] = &unk_25020CE18;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, v2);
  objc_copyWeak(&v40, &location);
  dispatch_after(v36, v35, v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsDragging:", 0);

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setNeedsDisplay");

}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_7(id *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "didStopDraggingHandle:", v3);

  v4 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v4, "popAnimateHandle");

  v5 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "setNeedsDisplay");

}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_opt_class();
  v5 = objc_loadWeakRetained(v2);
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_copyWeak(&v9, v2);
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v7 = v6;
  v8 = v4;
  AXPerformSafeBlock();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_9(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  id v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double x;
  double y;
  double width;
  double height;
  id v26;
  id v27;
  char v28;
  double v29;
  id v30;
  double v31;
  id v32;
  dispatch_time_t v33;
  uint64_t v34;
  NSObject *v35;
  dispatch_time_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id from;
  _QWORD block[4];
  id v43;
  id v44;
  id location;
  CGRect v46;
  CGRect v47;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setIsDragging:", 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setIsMaximum:", 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setIsMinimum:", 0);

  v6 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v6, "setHighlighted:", 1);

  objc_msgSend(a1[4], "setNeedsDisplay");
  v7 = a1[5];
  NSProtocolFromString(CFSTR("FMMapDragRadiusViewDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "conformsToProtocol:", v8);

  if ((_DWORD)v7)
  {
    v9 = a1[5];
    v10 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "willStartDraggingHandle:", v10);

  }
  v11 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;

  v16 = v13 + -3.0;
  v17 = objc_loadWeakRetained(v2);
  objc_msgSend(v17, "minPoint");
  v19 = v18;

  if (v16 < v19)
  {
    v20 = objc_loadWeakRetained(v2);
    objc_msgSend(v20, "setIsMinimum:", 1);

    accessibilityLocalizedString(CFSTR("distance.minimum.reached"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakOrQueueIfNeeded();

    v16 = v19;
  }
  v46.size.width = 24.0;
  v46.size.height = 24.0;
  v46.origin.x = v16;
  v46.origin.y = v15;
  v47 = CGRectIntegral(v46);
  x = v47.origin.x;
  y = v47.origin.y;
  width = v47.size.width;
  height = v47.size.height;
  v26 = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(v26, "setFrame:", x, y, width, height);

  objc_msgSend(a1[4], "setNeedsDisplay");
  v27 = objc_loadWeakRetained(v2);
  v28 = objc_msgSend(v27, "safeBoolForKey:", CFSTR("isMinimum"));

  if ((v28 & 1) != 0)
  {
    v29 = 100.0;
  }
  else
  {
    v30 = objc_loadWeakRetained(v2);
    objc_msgSend(v30, "currentHandleDistance");
    v29 = v31;

  }
  v32 = objc_loadWeakRetained(v2);
  objc_msgSend(v32, "_axSetCustomRadius:", v29);

  objc_initWeak(&location, a1[4]);
  v33 = dispatch_time(0, 50000000);
  v34 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_10;
  block[3] = &unk_25020CDF0;
  objc_copyWeak(&v43, v2);
  objc_copyWeak(&v44, &location);
  v35 = MEMORY[0x24BDAC9B8];
  dispatch_after(v33, MEMORY[0x24BDAC9B8], block);
  objc_initWeak(&from, a1[5]);
  v36 = dispatch_time(0, 300000000);
  v37[0] = v34;
  v37[1] = 3221225472;
  v37[2] = __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_11;
  v37[3] = &unk_25020CE18;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, v2);
  objc_copyWeak(&v40, &location);
  dispatch_after(v36, v35, v37);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsDragging:", 0);

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setNeedsDisplay");

}

void __59__FMMapDragRadiusViewAccessibility__axSetUpHandleImageView__block_invoke_11(id *a1)
{
  id WeakRetained;
  id v3;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(WeakRetained, "didStopDraggingHandle:", v3);

  v4 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(v4, "popAnimateHandle");

  v5 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "setNeedsDisplay");

}

@end
