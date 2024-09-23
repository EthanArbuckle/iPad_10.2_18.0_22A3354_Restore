@implementation MTAAlarmCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAlarmCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewController"), CFSTR("_removeAlarm:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTAAlarmCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAAlarmCollectionViewController"), CFSTR("_noItemsView"), "_UIContentUnavailableView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAAlarmCollectionViewController"), CFSTR("_dataSource"), "MTAlarmDataSource");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTAAlarmCollectionViewControllerAccessibility;
  -[MTAAlarmCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTAAlarmCollectionViewControllerAccessibility;
  -[MTAAlarmCollectionViewControllerAccessibility viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)_axDataSource
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MTAAlarmCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
