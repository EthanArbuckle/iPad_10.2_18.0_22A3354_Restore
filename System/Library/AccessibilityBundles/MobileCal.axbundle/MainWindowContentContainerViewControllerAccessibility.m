@implementation MainWindowContentContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MainWindowContentContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MainWindowRootViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("RootNavigationController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowContentContainerViewController"), CFSTR("_containerViewController"), "UIViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowContentContainerViewController"), CFSTR("_rootNavigationController"), "RootNavigationController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowContentContainerViewController"), CFSTR("initWithRootNavigationController:"), "@", "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("UISplitViewControllerDelegate"), CFSTR("splitViewController:willChangeToDisplayMode:"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("MainWindowContentContainerViewController"), CFSTR("UISplitViewControllerDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowContentContainerViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RootNavigationController"), CFSTR("viewSwitcher"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowContentContainerViewControllerAccessibility;
  -[MainWindowContentContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MainWindowContentContainerViewControllerAccessibility _accessibilitySetAccessibilityElements](self, "_accessibilitySetAccessibilityElements");
}

- (MainWindowContentContainerViewControllerAccessibility)initWithRootNavigationController:(id *)a3
{
  MainWindowContentContainerViewControllerAccessibility *v3;
  MainWindowContentContainerViewControllerAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MainWindowContentContainerViewControllerAccessibility;
  v3 = -[MainWindowContentContainerViewControllerAccessibility initWithRootNavigationController:](&v6, sel_initWithRootNavigationController_, a3);
  v4 = v3;
  if (v3)
    -[MainWindowContentContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_opt_class();
  -[MainWindowContentContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (void)_accessibilitySetAccessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  -[MainWindowContentContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rootNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("viewSwitcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MainWindowContentContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_containerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __95__MainWindowContentContainerViewControllerAccessibility__accessibilitySetAccessibilityElements__block_invoke;
  v10[3] = &unk_25027D350;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "ax_removeObjectsFromArrayUsingBlock:", v10);
  objc_msgSend(v6, "setAccessibilityElements:", v8);

}

BOOL __95__MainWindowContentContainerViewControllerAccessibility__accessibilitySetAccessibilityElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

@end
