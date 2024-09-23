@implementation MonogramPosterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MonogramPosterExtension.MonogramPosterViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MonogramPosterExtension.MonogramPosterViewController"), CFSTR("simulationView"), "Optional<MonogramSimulationView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MonogramPosterExtension.MonogramPosterViewController"), CFSTR("monogramString"), "String");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MonogramPosterViewControllerAccessibility;
  -[MonogramPosterViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[MonogramPosterViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("simulationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v8[3] = &unk_2502BFAD0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setIsAccessibilityElementBlock:", v8);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v6[3] = &unk_2502BFAF8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "setAccessibilityLabelBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

BOOL __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  _BOOL8 v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftStringForKey:", CFSTR("monogramString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

id __87__MonogramPosterViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftStringForKey:", CFSTR("monogramString"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MonogramPosterViewControllerAccessibility;
  -[MonogramPosterViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MonogramPosterViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
