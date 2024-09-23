@implementation SetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SetupController");
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupController"), CFSTR("_createNavigationController"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupController"), CFSTR("navigationController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupController"), CFSTR("_showModalWiFiSettings"), "v", 0);

}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v11) = 0;
  objc_opt_class();
  -[SetupControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationFlowController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("buddyControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogUIA();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "accessibilityIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_23299E000, v7, OS_LOG_TYPE_INFO, "NavBar: Buddy: identifier %@ %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v6, "accessibilityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SetupControllerAccessibility;
  -[SetupControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)_accessibilityMarkMainNavBar
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SetupControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("AXSetupMainNavBar"));

}

- (void)_createNavigationController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SetupControllerAccessibility;
  -[SetupControllerAccessibility _createNavigationController](&v3, sel__createNavigationController);
  -[SetupControllerAccessibility _accessibilityMarkMainNavBar](self, "_accessibilityMarkMainNavBar");
}

- (void)_showModalWiFiSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SetupControllerAccessibility;
  -[SetupControllerAccessibility _showModalWiFiSettings](&v8, sel__showModalWiFiSettings);
  objc_opt_class();
  -[SetupControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visibleViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();

  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilitySetIdentification:", CFSTR("AXSetupMainNavBar"));

}

@end
