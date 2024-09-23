@implementation CycleTimelineCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CycleTimelineCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("MenstrualCyclesAppPlugin.CycleTimelineCollectionViewController"), CFSTR("UICollectionViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CycleTimelineCollectionViewControllerAccessibility;
  -[CycleTimelineCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilitySetIdentification:", CFSTR("AXCycleTimelineCollectionView"));

}

@end
