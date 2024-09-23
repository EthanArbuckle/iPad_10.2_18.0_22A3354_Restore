@implementation SystemApertureElementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChronoCore.SystemApertureElementViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ChronoCore.SystemApertureElementViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChronoCore.SystemApertureElementViewController"), CFSTR("leadingUIHostingController"), "Optional<_JindoAccessoryViewController>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChronoCore.SystemApertureElementViewController"), CFSTR("leadingUIHostingController"), "Optional<_JindoAccessoryViewController>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChronoCore.SystemApertureElementViewController"), CFSTR("minimalUIHostingController"), "Optional<_JindoAccessoryViewController>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChronoCore.SystemApertureElementViewController"), CFSTR("expandedUIHostingController"), "Optional<_JindoAccessoryViewController>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUISystemApertureElementSource"), CFSTR("layoutMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindowScene"), CFSTR("systemApertureElementSource"), "@", 0);

}

- (int64_t)_accessibilityApertureLayoutMode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[SystemApertureElementViewControllerAccessibility view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("systemApertureElementSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "safeIntForKey:", CFSTR("layoutMode"));
  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SystemApertureElementViewControllerAccessibility;
  -[SystemApertureElementViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SystemApertureElementViewControllerAccessibility updateSystemApertureElements](self, "updateSystemApertureElements");
}

- (void)updateSystemApertureElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;

  objc_opt_class();
  -[SystemApertureElementViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("leadingUIHostingController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SystemApertureElementViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("trailingUIHostingController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SystemApertureElementViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("minimalUIHostingController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(location) = 0;
  objc_opt_class();
  -[SystemApertureElementViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("expandedUIHostingController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke;
  v22[3] = &unk_2501CE950;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v5, "_setAccessibilityElementsHiddenBlock:", v22);
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_2;
  v20[3] = &unk_2501CE950;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v8, "_setAccessibilityElementsHiddenBlock:", v20);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_3;
  v18[3] = &unk_2501CE950;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v11, "_setAccessibilityElementsHiddenBlock:", v18);
  v16[0] = v15;
  v16[1] = 3221225472;
  v16[2] = __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_4;
  v16[3] = &unk_2501CE950;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "_setAccessibilityElementsHiddenBlock:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityApertureLayoutMode") != 3;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityApertureLayoutMode") != 3;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityApertureLayoutMode") != 2;

  return v2;
}

BOOL __80__SystemApertureElementViewControllerAccessibility_updateSystemApertureElements__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityApertureLayoutMode") != 4;

  return v2;
}

- (void)addChildViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SystemApertureElementViewControllerAccessibility;
  -[SystemApertureElementViewControllerAccessibility addChildViewController:](&v4, sel_addChildViewController_, a3);
  -[SystemApertureElementViewControllerAccessibility updateSystemApertureElements](self, "updateSystemApertureElements");
}

@end
