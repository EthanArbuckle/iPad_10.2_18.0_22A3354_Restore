@implementation _MKLocompassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_MKLocompassView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("_MKLocompassView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKLocompassView"), CFSTR("_updateControlsVisibility"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKLocompassView"), CFSTR("setMapView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKLocompassView"), CFSTR("_compassView"), "MKCompassView_watchos");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_MKLocompassView"), CFSTR("_userTrackingButton"), "_MKUserTrackingButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKLocompassViewAccessibility;
  -[_MKLocompassViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[_MKLocompassViewAccessibility _axUpdateLabels](self, "_axUpdateLabels");
}

- (void)_updateControlsVisibility
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MKLocompassViewAccessibility;
  -[_MKLocompassViewAccessibility _updateControlsVisibility](&v3, sel__updateControlsVisibility);
  -[_MKLocompassViewAccessibility _axUpdateLabels](self, "_axUpdateLabels");
}

- (void)setMapView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MKLocompassViewAccessibility;
  -[_MKLocompassViewAccessibility setMapView:](&v4, sel_setMapView_, a3);
  -[_MKLocompassViewAccessibility _axUpdateLabels](self, "_axUpdateLabels");
}

- (void)_axUpdateLabels
{
  void *v3;
  void *v4;
  id v5;

  -[_MKLocompassViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_userTrackingButton"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKLocompassViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v3);

  objc_msgSend(v5, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MKLocompassViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v4);

}

@end
