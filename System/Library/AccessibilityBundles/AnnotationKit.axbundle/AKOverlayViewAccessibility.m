@implementation AKOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKOverlayView"), CFSTR("pageController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("pageIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("inkPageOverlayController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKInkPageOverlayController"), CFSTR("inkOverlayView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKInkOverlayView"), CFSTR("canvasView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKInkOverlayView_iOS"), CFSTR("AKInkOverlayView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKPageController"), CFSTR("controller"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKController"), CFSTR("toolController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKController"), CFSTR("annotationEditingEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKController"), CFSTR("currentPageIndex"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKToolController"), CFSTR("toolMode"), "Q", 0);

}

- (BOOL)_axShouldExposeDrawingElement
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  -[AKOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("pageIndex"));

  -[AKOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("controller"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "safeUnsignedIntegerForKey:", CFSTR("currentPageIndex"));
  objc_msgSend(v6, "safeValueForKey:", CFSTR("toolController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "safeUnsignedIntegerForKey:", CFSTR("toolMode")) && v4 == v7)
    v9 = 1;
  else
    v9 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("annotationEditingEnabled"));

  return v9;
}

- (id)_axOverlayViewElement
{
  JUMPOUT(0x234905984);
}

- (void)_axSetOverlayViewElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axOverlayViewLayers
{
  JUMPOUT(0x234905984);
}

- (void)_axSetOverlayViewLayers:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityCreateOverlayViewElement
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (-[AKOverlayViewAccessibility _axShouldExposeDrawingElement](self, "_axShouldExposeDrawingElement"))
  {
    -[AKOverlayViewAccessibility _axOverlayViewElement](self, "_axOverlayViewElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
      objc_initWeak(&location, self);
      v4 = MEMORY[0x24BDAC760];
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke;
      v9[3] = &unk_25014EE28;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v3, "_setAccessibilityLabelBlock:", v9);
      accessibilityLocalizedString(CFSTR("drawing.hint"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAccessibilityHint:", v5);

      objc_msgSend(v3, "setAccessibilityActivationPoint:", -1.0, -1.0);
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke_2;
      v7[3] = &unk_25014EE50;
      objc_copyWeak(&v8, &location);
      objc_msgSend(v3, "_setAccessibilityFrameBlock:", v7);
      -[AKOverlayViewAccessibility _axSetOverlayViewElement:](self, "_axSetOverlayViewElement:", v3);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("pageController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("pageIndex"));

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("page.index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

double __68__AKOverlayViewAccessibility__accessibilityCreateOverlayViewElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  objc_super v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)AKOverlayViewAccessibility;
  -[AKOverlayViewAccessibility accessibilityElements](&v32, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[AKOverlayViewAccessibility _accessibilityCreateOverlayViewElement](self, "_accessibilityCreateOverlayViewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_opt_class();
    -[AKOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("layerPresentationManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("rootLayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sublayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKOverlayViewAccessibility _axOverlayViewLayers](self, "_axOverlayViewLayers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    if ((objc_msgSend(v11, "isEqualToArray:", v12) & 1) == 0)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "setAccessibilityContainer:", 0);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
        }
        while (v15);
      }

      v12 = (void *)objc_msgSend(v11, "copy");
      -[AKOverlayViewAccessibility _axSetOverlayViewLayers:](self, "_axSetOverlayViewLayers:", v12);
    }
    if (v6)
    {
      v33 = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v12);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = v12;
    }
    v31 = 0;
    -[AKOverlayViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeValueForKey:", CFSTR("inkPageOverlayController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safeValueForKey:", CFSTR("inkOverlayView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safeValueForKey:", CFSTR("canvasView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      abort();
    if (v23)
    {
      objc_msgSend(v5, "arrayByAddingObject:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v24;
    }

  }
  return v5;
}

@end
