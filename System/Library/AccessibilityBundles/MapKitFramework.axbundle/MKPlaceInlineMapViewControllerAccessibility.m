@implementation MKPlaceInlineMapViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceInlineMapViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlaceInlineMapViewController"), CFSTR("_contentView"), "_MKPlaceInlineMapContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceInlineMapViewController"), CFSTR("mapItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItem"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceInlineMapViewController"), CFSTR("_updateMap"), "v", 0);

}

- (void)_axUpdateMapContentView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MKPlaceInlineMapViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceInlineMapViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  AXMapKitLocString(CFSTR("MAP_CONTAINING"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v9);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewControllerAccessibility;
  -[MKPlaceInlineMapViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MKPlaceInlineMapViewControllerAccessibility _axUpdateMapContentView](self, "_axUpdateMapContentView");
}

- (void)_updateMap
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceInlineMapViewControllerAccessibility;
  -[MKPlaceInlineMapViewControllerAccessibility _updateMap](&v3, sel__updateMap);
  -[MKPlaceInlineMapViewControllerAccessibility _axUpdateMapContentView](self, "_axUpdateMapContentView");
}

@end
