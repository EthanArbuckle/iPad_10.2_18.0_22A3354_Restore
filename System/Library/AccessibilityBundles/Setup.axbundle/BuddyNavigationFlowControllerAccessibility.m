@implementation BuddyNavigationFlowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyNavigationFlowController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupController"), CFSTR("navigationFlowController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowController"), CFSTR("buddyControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowController"), CFSTR("wifiController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowController"), CFSTR("navigator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowController"), CFSTR("_presentViewControllerForBuddyController:animated:willPresentViewController:completion:"), "v", "@", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyNavigationFlowNavigator"), CFSTR("navigationController"), "@", 0);

}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v10) = 0;
  objc_opt_class();
  -[BuddyNavigationFlowControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buddyControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUIA();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "accessibilityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_23299E000, v6, OS_LOG_TYPE_INFO, "NavBar: Buddy: identifier %@ %@", (uint8_t *)&v10, 0x16u);

  }
  objc_msgSend(v5, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  -[BuddyNavigationFlowControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[BuddyNavigationFlowControllerAccessibility _accessibilityMarkMainNavBar](self, "_accessibilityMarkMainNavBar");
}

- (void)_presentViewControllerForBuddyController:(id)a3 animated:(BOOL)a4 willPresentViewController:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  objc_super v10;
  _QWORD v11[4];
  BuddyNavigationFlowControllerAccessibility *v12;
  id v13;

  v7 = a4;
  v11[1] = 3221225472;
  v11[2] = __133__BuddyNavigationFlowControllerAccessibility__presentViewControllerForBuddyController_animated_willPresentViewController_completion___block_invoke;
  v11[3] = &unk_250344000;
  v12 = self;
  v13 = a6;
  v10.receiver = v12;
  v10.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  v11[0] = MEMORY[0x24BDAC760];
  v9 = v13;
  -[BuddyNavigationFlowControllerAccessibility _presentViewControllerForBuddyController:animated:willPresentViewController:completion:](&v10, sel__presentViewControllerForBuddyController_animated_willPresentViewController_completion_, a3, v7, a5, v11);

}

void __133__BuddyNavigationFlowControllerAccessibility__presentViewControllerForBuddyController_animated_willPresentViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogUIA();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_23299E000, v4, OS_LOG_TYPE_INFO, "NavBar: Buddy: present view controller %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityMarkMainNavBar");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)_accessibilityMarkMainNavBar
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[BuddyNavigationFlowControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("navigator.navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("AXSetupMainNavBar"));

}

- (id)wifiController
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BuddyNavigationFlowControllerAccessibility;
  -[BuddyNavigationFlowControllerAccessibility wifiController](&v5, sel_wifiController);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PreferenceBundles/AirPortSettings.bundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "load");
  objc_msgSend(MEMORY[0x24BEBADF8], "loadAccessibilityBundleForBundle:didLoadCallback:force:loadAllAccessibilityInfo:", v3, 0, 1, 0);

  return v2;
}

@end
