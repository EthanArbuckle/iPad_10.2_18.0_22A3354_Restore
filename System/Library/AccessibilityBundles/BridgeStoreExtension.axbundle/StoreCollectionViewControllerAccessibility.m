@implementation StoreCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BridgeStoreExtension.StoreCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("BridgeStoreExtension.StoreCollectionViewController"), CFSTR("UICollectionViewController"));
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StoreCollectionViewControllerAccessibility;
  -[StoreCollectionViewControllerAccessibility loadView](&v3, sel_loadView);
  -[StoreCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StoreCollectionViewControllerAccessibility;
  -[StoreCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[StoreCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_AXSAutomationEnabled() && !UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v4, "setIsAccessibilityElement:", 0);
    objc_msgSend(v4, "setAccessibilityElements:", 0);
  }

}

@end
