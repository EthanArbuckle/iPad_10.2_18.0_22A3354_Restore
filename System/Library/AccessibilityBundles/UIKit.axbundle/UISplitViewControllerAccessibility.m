@implementation UISplitViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISplitViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISplitViewController"), CFSTR("_impl"), "<UISplitViewControllerImpl>");
  objc_msgSend(location[0], "validateClass:conformsToProtocol:", CFSTR("UISplitViewControllerClassicImpl"));
  objc_msgSend(location[0], "validateClass:conformsToProtocol:", CFSTR("UISplitViewControllerPanelImpl"), CFSTR("UISplitViewControllerImpl"));
  objc_storeStrong(location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UISplitViewControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewControllerAccessibility;
  -[UISplitViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v6);
}

- (void)_axModalizeViewControllerViews
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id obj;
  uint64_t v6;
  id location;
  _QWORD __b[8];
  id v9;
  char v10;
  id v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  if (a1)
  {
    v10 = 1;
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(v11, "safeValueForKey:", CFSTR("viewControllers"));
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
    if (v6)
    {
      v2 = *(_QWORD *)__b[2];
      v3 = 0;
      v4 = v6;
      while (1)
      {
        v1 = v3;
        if (*(_QWORD *)__b[2] != v2)
          objc_enumerationMutation(obj);
        v9 = *(id *)(__b[1] + 8 * v3);
        location = (id)objc_msgSend(v9, "view");
        objc_msgSend(location, "setShouldGroupAccessibilityChildren:", 1);
        if ((v10 & 1) != 0 && (objc_msgSend(v11, "isCollapsed") & 1) == 0 && objc_msgSend(v11, "displayMode") == 2)
        {
          objc_msgSend(location, "_accessibilitySetIsScannerGroup:", 1);
          objc_msgSend(location, "_accessibilitySetScannerGroupTraits:", 16);
        }
        else
        {
          objc_msgSend(location, "_accessibilitySetIsScannerGroup:", 0);
          objc_msgSend(location, "_accessibilitySetScannerGroupTraits:", 0);
        }
        v10 = 0;
        objc_storeStrong(&location, 0);
        ++v3;
        if (v1 + 1 >= v4)
        {
          v3 = 0;
          v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v12, 16);
          if (!v4)
            break;
        }
      }
    }

  }
}

- (void)setViewControllers:(id)a3
{
  objc_super v3;
  id location[2];
  UISplitViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISplitViewControllerAccessibility;
  -[UISplitViewControllerAccessibility setViewControllers:](&v3, sel_setViewControllers_, location[0]);
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v5);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  id v8;
  objc_super v9;
  SEL v10;
  UISplitViewControllerAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)UISplitViewControllerAccessibility;
  -[UISplitViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v11);
  v8 = (id)-[UISplitViewControllerAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("_impl"));
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __80__UISplitViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6 = &unk_24FF3DA40;
  v7 = v8;
  AXPerformSafeBlock();
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
}

uint64_t __80__UISplitViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformation", a1, a1);
}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UISplitViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_impl"));
  v3 = (id)objc_msgSend(v4[0], "_accessibilitySpeakThisViewController");
  objc_storeStrong(v4, 0);
  return v3;
}

@end
