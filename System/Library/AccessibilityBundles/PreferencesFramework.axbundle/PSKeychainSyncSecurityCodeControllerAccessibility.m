@implementation PSKeychainSyncSecurityCodeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSKeychainSyncSecurityCodeController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSKeychainSyncSecurityCodeController"), CFSTR("_footerButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSKeychainSyncSecurityCodeController"), CFSTR("_configureTextEntryCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSKeychainSyncSecurityCodeController"), CFSTR("textEntryCell"), "@", 0);

}

- (void)_accessibilityMarkupTable
{
  void *v3;
  void *v4;
  id v5;

  -[PSKeychainSyncSecurityCodeControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("table"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("KeychainSynchTable"));

  -[PSKeychainSyncSecurityCodeControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("table"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PSKeychainSyncSecurityCodeControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_footerButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetAssignedValue:forKey:", v4, CFSTR("Footer"));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  -[PSKeychainSyncSecurityCodeControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PSKeychainSyncSecurityCodeControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  -[PSKeychainSyncSecurityCodeControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  v3 = -[PSKeychainSyncSecurityCodeControllerAccessibility safeValueForKey:](&v4, sel_safeValueForKey_, CFSTR("textEntryCell"));
  -[PSKeychainSyncSecurityCodeControllerAccessibility _accessibilityMarkupTable](self, "_accessibilityMarkupTable");
}

- (id)_configureTextEntryCell
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSKeychainSyncSecurityCodeControllerAccessibility;
  -[PSKeychainSyncSecurityCodeControllerAccessibility _configureTextEntryCell](&v4, sel__configureTextEntryCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("SecurityTextEntryCell"));
  return v2;
}

@end
