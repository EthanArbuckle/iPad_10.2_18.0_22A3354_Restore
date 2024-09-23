@implementation _UIStatusBarBatteryItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarBatteryItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIStatusBarBatteryItem");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("percentView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItem"), CFSTR("isEnabled"), "B", 0);
  v3 = CFSTR("_UIStatusBarItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v4, v3);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, CFSTR("percentDisplayIdentifier"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("applyUpdate:toDisplayItem:"), v5, v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIStatusBarBatteryItemAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  -[_UIStatusBarBatteryItemAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[_UIStatusBarBatteryItemAccessibility safeValueForKey:](v5, "safeValueForKey:", CFSTR("percentView"));
  objc_msgSend(v2, "setIsAccessibilityElement:", 0);
  objc_storeStrong(&v2, 0);
}

- (_UIStatusBarBatteryItemAccessibility)init
{
  _UIStatusBarBatteryItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarBatteryItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  v6 = -[_UIStatusBarBatteryItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarBatteryItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  int v10;
  int v11;
  double (*v12)(id *);
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  double (*v18)(id *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id from;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  id v29;
  id v30;
  id location[2];
  _UIStatusBarBatteryItemAccessibility *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v28.receiver = v32;
  v28.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  v29 = -[_UIStatusBarBatteryItemAccessibility applyUpdate:toDisplayItem:](&v28, sel_applyUpdate_toDisplayItem_, location[0], v30);
  v27 = (id)objc_msgSend(v30, "safeValueForKey:", CFSTR("identifier"));
  v26 = (id)objc_msgSend((id)objc_opt_class(), "safeValueForKey:", CFSTR("percentDisplayIdentifier"));
  if ((objc_msgSend(v27, "isEqual:", v26) & 1) != 0)
  {
    v25 = (id)-[_UIStatusBarBatteryItemAccessibility safeUIViewForKey:](v32, "safeUIViewForKey:", CFSTR("batteryView"));
    objc_initWeak(&from, v25);
    v23 = (id)-[_UIStatusBarBatteryItemAccessibility safeUIViewForKey:](v32, "safeUIViewForKey:", CFSTR("percentView"));
    objc_initWeak(&v22, v23);
    if ((objc_msgSend(v30, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != 0)
    {
      v7 = v25;
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke;
      v19 = &unk_24FF3FB70;
      objc_copyWeak(&v20, &from);
      objc_copyWeak(&v21, &v22);
      objc_msgSend(v7, "_setAccessibilityFrameBlock:", &v15);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v20);
    }
    else
    {
      v6 = v25;
      v9 = MEMORY[0x24BDAC760];
      v10 = -1073741824;
      v11 = 0;
      v12 = __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2;
      v13 = &unk_24FF3DD28;
      objc_copyWeak(&v14, &from);
      objc_msgSend(v6, "_setAccessibilityFrameBlock:", &v9);
      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&v22);
    objc_storeStrong(&v23, 0);
    objc_destroyWeak(&from);
    objc_storeStrong(&v25, 0);
  }
  v5 = v29;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v5;
}

@end
