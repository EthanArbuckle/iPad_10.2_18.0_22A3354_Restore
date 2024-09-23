@implementation MapsAppDelegateAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsAppDelegate");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsAppDelegateAccessibility;
  -[MapsAppDelegateAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MapsAppDelegateAccessibility _accessibilityLoadAccessibilityInformationWithKeyPath:retries:](self, "_accessibilityLoadAccessibilityInformationWithKeyPath:retries:", CFSTR("chromeViewController.mapView.mapLayer"), 8);
}

- (void)_accessibilityLoadAccessibilityInformationWithKeyPath:(id)a3 retries:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[MapsAppDelegateAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "_accessibilityLoadAccessibilityInformation");
  }
  else if (a4)
  {
    v9 = v6;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

uint64_t __94__MapsAppDelegateAccessibility__accessibilityLoadAccessibilityInformationWithKeyPath_retries___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityLoadAccessibilityInformationWithKeyPath:retries:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48) - 1);
}

@end
