@implementation MKBasicMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKBasicMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKBasicMapView"), CFSTR("initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKBasicMapView"), CFSTR("mapView"), "@", 0);

}

- (MKBasicMapViewAccessibility)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6
{
  MKBasicMapViewAccessibility *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MKBasicMapViewAccessibility;
  v6 = -[MKBasicMapViewAccessibility initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:](&v9, sel_initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = -[MKBasicMapViewAccessibility accessibilityElements](v6, "accessibilityElements");

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKBasicMapViewAccessibility;
  -[MKBasicMapViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v3 = -[MKBasicMapViewAccessibility accessibilityElements](self, "accessibilityElements");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MKBasicMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[MKBasicMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setAccessibilityContainer:", self);
    objc_msgSend(v3, "addObject:", v5);
  }
  -[MKBasicMapViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_annotationContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setAccessibilityContainer:", self);
    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  char v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  if (accessibilityCustomRotors__VKFeatureAccessibilityElementClassOnceToken != -1)
    dispatch_once(&accessibilityCustomRotors__VKFeatureAccessibilityElementClassOnceToken, &__block_literal_global_2);
  -[MKBasicMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsInTourGuideMode"));
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsShowingRoutes"));
  v6 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsInExplorationMode"));
  v7 = 0;
  if ((v4 & 1) == 0 && (v5 & 1) == 0 && (v6 & 1) == 0)
  {
    -[MKBasicMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPOIRotor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBasicMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTransitStopsRotor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKBasicMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXTransitLinesRotor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_initWeak(&location, self);
      v11 = objc_alloc(MEMORY[0x24BDF6790]);
      AXMapKitLocString(CFSTR("POI_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_2;
      v25[3] = &unk_2502507D8;
      objc_copyWeak(&v26, &location);
      v8 = (void *)objc_msgSend(v11, "initWithName:itemSearchBlock:", v12, v25);

      -[MKBasicMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("AXPOIRotor"));
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    if (!v9)
    {
      objc_initWeak(&location, self);
      v13 = objc_alloc(MEMORY[0x24BDF6790]);
      AXMapKitLocString(CFSTR("TRANSIT_STOPS_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_4;
      v23[3] = &unk_2502507D8;
      objc_copyWeak(&v24, &location);
      v9 = (void *)objc_msgSend(v13, "initWithName:itemSearchBlock:", v14, v23);

      -[MKBasicMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXTransitStopsRotor"));
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    if (!v10)
    {
      objc_initWeak(&location, self);
      v15 = objc_alloc(MEMORY[0x24BDF6790]);
      AXMapKitLocString(CFSTR("TRANSIT_LINES_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_6;
      v21 = &unk_2502507D8;
      objc_copyWeak(&v22, &location);
      v10 = (void *)objc_msgSend(v15, "initWithName:itemSearchBlock:", v16, &v18);

      -[MKBasicMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AXTransitLinesRotor"), v18, v19, v20, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    v28[0] = v8;
    v28[1] = v9;
    v28[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

Class __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("VKFeatureAccessibilityElement"));
  accessibilityCustomRotors__VKFeatureAccessibilityElementClass = (uint64_t)result;
  return result;
}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_3;
  v12[3] = &unk_2502507B0;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "_accessibilityCustomRotorResultHelper:array:", v3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPOI")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_5;
  v12[3] = &unk_2502507B0;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "_accessibilityCustomRotorResultHelper:array:", v3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "safeBoolForKey:", CFSTR("isTransitStop")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

id __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_7;
  v12[3] = &unk_2502507B0;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "_accessibilityCustomRotorResultHelper:array:", v3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __56__MKBasicMapViewAccessibility_accessibilityCustomRotors__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "safeBoolForKey:", CFSTR("isTransitLine")))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  -[MKBasicMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

@end
