@implementation COSSetupFinishedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSSetupFinishedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PBBridgeProgressView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PBBridgeProgressView"), CFSTR("currentProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSSetupFinishedViewController"), CFSTR("illustratedSyncView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSSetupFinishedViewController"), CFSTR("progressView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSSetupFinishedViewController"), CFSTR("progress"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)COSSetupFinishedViewControllerAccessibility;
  -[COSSetupFinishedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  -[COSSetupFinishedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("illustratedSyncView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("sync.progress"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);

    v6 = MEMORY[0x24BDAC760];
    v7 = 3221225472;
    v8 = __89__COSSetupFinishedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v9 = &unk_250197118;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", &v6);
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF7430], v6, v7, v8, v9);
    objc_msgSend(v4, "_accessibilitySetUserDefinedMediaAnalysisOptions:", &unk_25019A2F0);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

id __89__COSSetupFinishedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_accessibilityBoolValueForKey:", CFSTR("isSyncComplete")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("progressView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("currentProgress"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");

    AXFormatFloatWithPercentage();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXIsInternalInstall())
    {
      objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("progress"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Apple Internal Info: %@"), v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v8 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v8;
      }

    }
  }

  return v2;
}

@end
