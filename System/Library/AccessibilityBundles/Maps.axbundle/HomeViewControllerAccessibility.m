@implementation HomeViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HomeViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("HomeViewController"), CFSTR("_collectionView"), "UICollectionView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeViewControllerAccessibility;
  -[HomeViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[HomeViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("collection.locations.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
