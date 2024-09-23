@implementation _TVMLCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVMLCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_TVCollectionWrappingView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVCollectionWrappingView"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMLCollectionViewController"), CFSTR("collectionWrappingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVMLCollectionViewController"), CFSTR("_updateHeaderView"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVMLCollectionViewControllerAccessibility;
  -[_TVMLCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[_TVMLCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionWrappingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("headerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (void)_updateHeaderView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVMLCollectionViewControllerAccessibility;
  -[_TVMLCollectionViewControllerAccessibility _updateHeaderView](&v3, sel__updateHeaderView);
  -[_TVMLCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
