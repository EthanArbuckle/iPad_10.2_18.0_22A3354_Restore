@implementation PMEditorRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMEditorRootViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMEditorRootViewController"), CFSTR("orientationButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMEditorRootViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PMEditorRootViewControllerAccessibility;
  -[PMEditorRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[PMEditorRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("orientationButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  accessibilityMemoriesLocalizedString(CFSTR("aspect.ratio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85__PMEditorRootViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_24FEF70A0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

id __85__PMEditorRootViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isSelected"))
    v2 = CFSTR("vertical.aspect.ratio");
  else
    v2 = CFSTR("horizontal.aspect.ratio");
  accessibilityMemoriesLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMEditorRootViewControllerAccessibility;
  -[PMEditorRootViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PMEditorRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
