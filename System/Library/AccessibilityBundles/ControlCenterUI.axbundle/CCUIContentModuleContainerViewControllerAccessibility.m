@implementation CCUIContentModuleContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIContentModuleContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("contentViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("contentModule"), "@", 0);

}

- (id)_accessibilityLoadAccessibilityInformationSupplementaryItems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[CCUIContentModuleContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIContentModuleContainerViewControllerAccessibility;
  -[CCUIContentModuleContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIContentModuleContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityShouldGroupAccessibilityChildrenBlock:", &__block_literal_global_1);

  -[CCUIContentModuleContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentModule"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

}

uint64_t __99__CCUIContentModuleContainerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

@end
