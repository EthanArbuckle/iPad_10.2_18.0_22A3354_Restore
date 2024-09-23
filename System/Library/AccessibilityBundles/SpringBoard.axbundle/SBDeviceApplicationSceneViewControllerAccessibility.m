@implementation SBDeviceApplicationSceneViewControllerAccessibility

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewControllerAccessibility;
  -[SBDeviceApplicationSceneViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBDeviceApplicationSceneViewControllerAccessibility _accessibilityMarkupView](self, "_accessibilityMarkupView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneViewControllerAccessibility;
  -[SBDeviceApplicationSceneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBDeviceApplicationSceneViewControllerAccessibility _accessibilityMarkupView](self, "_accessibilityMarkupView");
}

- (void)_accessibilityMarkupView
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id from;
  id location;

  LOBYTE(location) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__SBDeviceApplicationSceneViewControllerAccessibility__accessibilityMarkupView__block_invoke;
  v5[3] = &unk_250367B80;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "_setAccessibilityElementsBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDeviceApplicationSceneViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeviceApplicationSceneViewController"), CFSTR("_activeOverlayViewProviders"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneOverlayViewProvider"), CFSTR("_realOverlayViewController"), "@", 0);

}

id __79__SBDeviceApplicationSceneViewControllerAccessibility__accessibilityMarkupView__block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v2;
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v5);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "safeArrayForKey:", CFSTR("_activeOverlayViewProviders"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v12, "safeValueForKey:", CFSTR("_realOverlayViewController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_loadWeakRetained(v3);
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 != v18)
        {
          objc_msgSend(v16, "subviews");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "axSafelyAddObjectsFromArray:", v19);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v20 = (void *)MEMORY[0x24BDF6F90];
  objc_msgSend(v25, "reverseObjectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_subviewsReplacedByModalViewSubviewsIfNecessary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
