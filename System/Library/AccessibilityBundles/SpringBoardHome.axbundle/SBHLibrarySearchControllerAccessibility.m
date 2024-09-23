@implementation SBHLibrarySearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHLibrarySearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibrarySearchController"), CFSTR("isActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibrarySearchController"), CFSTR("setActive:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHLibrarySearchController"), CFSTR("searchResultsController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHIconLibraryTableViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHLibrarySearchControllerAccessibility;
  -[SBHLibrarySearchControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[SBHLibrarySearchControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("searchResultsController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__SBHLibrarySearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v7[3] = &unk_250383D20;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v6, "_setAccessibilityViewIsModalBlock:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

uint64_t __85__SBHLibrarySearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isActive"));

  return v2;
}

- (BOOL)accessibilityPerformEscape
{
  int v2;

  v2 = -[SBHLibrarySearchControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
  if (v2)
    AXPerformSafeBlock();
  return v2;
}

uint64_t __69__SBHLibrarySearchControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[SBHLibrarySearchControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isActive"));
  v6.receiver = self;
  v6.super_class = (Class)SBHLibrarySearchControllerAccessibility;
  -[SBHLibrarySearchControllerAccessibility setActive:](&v6, sel_setActive_, v3);
  if (v5 != v3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
