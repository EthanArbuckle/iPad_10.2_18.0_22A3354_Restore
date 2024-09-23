@implementation MapsUserLocationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsUserLocationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MapsUserLocationView"), CFSTR("MKAnnotationView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsUserLocationView"), CFSTR("isVLFBannerVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsUserLocationView"), CFSTR("vlfPuckModeCircleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MapsUserLocationView"), CFSTR("_vlfPuckModeCircleView"), "VLFPuckModeCircleView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsUserLocationView"), CFSTR("isVLFPuckVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VLFPuckModeCircleView"), CFSTR("UIView"));

}

- (void)_axAnnotatePuck
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[MapsUserLocationViewAccessibility _axPuck](self, "_axPuck");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke;
  v7[3] = &unk_250258DB8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v7);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke_2;
  v5[3] = &unk_250258ED0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

id __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __52__MapsUserLocationViewAccessibility__axAnnotatePuck__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "accessibilityTraits");

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsUserLocationViewAccessibility;
  -[MapsUserLocationViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MapsUserLocationViewAccessibility _axAnnotatePuck](self, "_axAnnotatePuck");
}

- (id)_axPuck
{
  return (id)-[MapsUserLocationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_vlfPuckModeCircleView"));
}

- (BOOL)_axIsShowingVLFCallout
{
  return -[MapsUserLocationViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVLFBannerVisible"));
}

- (BOOL)_axIsShowingVLFUI
{
  return -[MapsUserLocationViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isVLFPuckVisible"));
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if (-[MapsUserLocationViewAccessibility _axIsShowingVLFCallout](self, "_axIsShowingVLFCallout"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationViewAccessibility;
  return -[MapsUserLocationViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[MapsUserLocationViewAccessibility _axIsShowingVLFUI](self, "_axIsShowingVLFUI"))
  {
    AXMapsLocString(CFSTR("REFINE_MY_LOCATION"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationViewAccessibility;
    -[MapsUserLocationViewAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityHint
{
  objc_super v4;

  if (-[MapsUserLocationViewAccessibility _axIsShowingVLFUI](self, "_axIsShowingVLFUI"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)MapsUserLocationViewAccessibility;
  -[MapsUserLocationViewAccessibility accessibilityHint](&v4, sel_accessibilityHint);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsUserLocationViewAccessibility;
  v3 = -[MapsUserLocationViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[MapsUserLocationViewAccessibility _axIsShowingVLFUI](self, "_axIsShowingVLFUI");
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)_axVLFElements
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_calloutView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    AXLogAppAccessibility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[MapsUserLocationViewAccessibility _axVLFElements].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[MapsUserLocationViewAccessibility _axPuck](self, "_axPuck");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    AXLogAppAccessibility();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[MapsUserLocationViewAccessibility _axVLFElements].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    goto LABEL_11;
  }
  if (!v4)
  {
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  v25[0] = v13;
  v25[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v15;
}

- (id)accessibilityElements
{
  void *v3;
  objc_super v5;

  if (!-[MapsUserLocationViewAccessibility _axIsShowingVLFCallout](self, "_axIsShowingVLFCallout")
    || (-[MapsUserLocationViewAccessibility _axVLFElements](self, "_axVLFElements"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsUserLocationViewAccessibility;
    -[MapsUserLocationViewAccessibility accessibilityElements](&v5, sel_accessibilityElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (-[MapsUserLocationViewAccessibility _axIsShowingVLFCallout](self, "_axIsShowingVLFCallout"))
  {
    -[MapsUserLocationViewAccessibility _axVLFElements](self, "_axVLFElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v24 = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v15, "convertPoint:fromView:", v9, x, y);
            objc_msgSend(v15, "_accessibilityHitTest:withEvent:", v7);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = (void *)v16;

              goto LABEL_14;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v12)
            continue;
          break;
        }
      }

    }
  }
  v19.receiver = self;
  v19.super_class = (Class)MapsUserLocationViewAccessibility;
  -[MapsUserLocationViewAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v17;
}

- (id)vlfPuckModeCircleView
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsUserLocationViewAccessibility;
  -[MapsUserLocationViewAccessibility vlfPuckModeCircleView](&v5, sel_vlfPuckModeCircleView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MapsUserLocationViewAccessibility _axAnnotatePuck](self, "_axAnnotatePuck");
  return v3;
}

- (void)_axVLFElements
{
  OUTLINED_FUNCTION_0(&dword_232703000, a1, a3, "VLF callout was supposed to be visible, but could not find callout.", a5, a6, a7, a8, 0);
}

@end
