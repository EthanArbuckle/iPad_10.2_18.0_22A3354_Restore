@implementation MRUMirroringViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUMirroringViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUMirroringViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUMirroringViewController"), CFSTR("CCUIMenuModuleViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIMenuModuleViewController"), CFSTR("CCUIButtonModuleViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewController"), CFSTR("buttonView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUMirroringViewControllerAccessibility;
  -[MRUMirroringViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[MRUMirroringViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __85__MRUMirroringViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7 = &unk_25014AF60;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &v4);
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

uint64_t __85__MRUMirroringViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  v3 = MEMORY[0x24BDF73C0];
  if (!v2)
    v3 = MEMORY[0x24BDF73B0];
  return *(_QWORD *)v3;
}

- (id)_accessibilityControlCenterElementToFocusAfterClose
{
  return (id)-[MRUMirroringViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonView"));
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUMirroringViewControllerAccessibility;
  -[MRUMirroringViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MRUMirroringViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
