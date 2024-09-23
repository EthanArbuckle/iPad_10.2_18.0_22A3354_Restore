@implementation STUIStatusBarBatteryItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  -[STUIStatusBarBatteryItemAccessibility applyUpdate:toDisplayItem:](&v22, sel_applyUpdate_toDisplayItem_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "safeValueForKey:", CFSTR("percentDisplayIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqual:", v10))
  {
    -[STUIStatusBarBatteryItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("batteryView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v11);
    -[STUIStatusBarBatteryItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("percentView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v12);
    if (objc_msgSend(v7, "safeBoolForKey:", CFSTR("isEnabled")))
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke;
      v17[3] = &unk_25039D998;
      v13 = &v18;
      objc_copyWeak(&v18, &location);
      objc_copyWeak(&v19, &from);
      objc_msgSend(v11, "_setAccessibilityFrameBlock:", v17);
      objc_destroyWeak(&v19);
    }
    else
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2;
      v15[3] = &unk_25039D9C0;
      v13 = &v16;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v11, "_setAccessibilityFrameBlock:", v15);
    }
    objc_destroyWeak(v13);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  -[STUIStatusBarBatteryItemAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarBatteryItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("percentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarBatteryItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBatteryItem"), CFSTR("batteryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBatteryItem"), CFSTR("percentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItem"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItem"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarBatteryItem"), CFSTR("STUIStatusBarItem"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("STUIStatusBarBatteryItem"), CFSTR("percentDisplayIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBatteryItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);

}

- (STUIStatusBarBatteryItemAccessibility)init
{
  STUIStatusBarBatteryItemAccessibility *v2;
  STUIStatusBarBatteryItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarBatteryItemAccessibility;
  v2 = -[STUIStatusBarBatteryItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarBatteryItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

double __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  v35.origin.x = v12;
  v35.origin.y = v13;
  v35.size.width = v14;
  v35.size.height = v15;
  v33.origin.x = v5;
  v33.origin.y = v7;
  v33.size.width = v9;
  v33.size.height = v11;
  v34 = CGRectUnion(v33, v35);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  objc_msgSend(WeakRetained, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "convertRect:toView:", 0, x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(WeakRetained, "window");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertRect:toWindow:", 0, v22, v24, v26, v28);
  v31 = v30;

  return v31;
}

double __67__STUIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "frame");
  objc_msgSend(v2, "convertRect:toView:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(WeakRetained, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:toWindow:", 0, v4, v6, v8, v10);
  v13 = v12;

  return v13;
}

@end
