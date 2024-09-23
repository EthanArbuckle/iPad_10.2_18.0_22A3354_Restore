@implementation CFXControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CFXControlsViewControllerAccessibility;
  -[CFXControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CFXControlsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __84__CFXControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2501A9FB0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityElementsBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __84__CFXControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXControlsViewControllerAccessibility;
  -[CFXControlsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CFXControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
