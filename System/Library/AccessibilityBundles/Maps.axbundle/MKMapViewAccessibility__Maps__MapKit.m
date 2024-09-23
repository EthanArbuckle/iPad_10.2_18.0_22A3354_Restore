@implementation MKMapViewAccessibility__Maps__MapKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("snapshotImageWithScale:"), "@", "d", 0);
}

- (id)snapshotImageWithScale:(double)a3
{
  void *v5;
  objc_super v7;

  _UIAccessibilityBlockPostingOfNotification();
  v7.receiver = self;
  v7.super_class = (Class)MKMapViewAccessibility__Maps__MapKit;
  -[MKMapViewAccessibility__Maps__MapKit snapshotImageWithScale:](&v7, sel_snapshotImageWithScale_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIAccessibilityUnblockPostingOfNotification();
  return v5;
}

@end
