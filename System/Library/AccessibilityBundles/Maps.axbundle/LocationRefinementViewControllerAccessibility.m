@implementation LocationRefinementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LocationRefinementViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LocationRefinementViewController"), CFSTR("_snapToUserLocationButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LocationRefinementViewController"), CFSTR("_crosshairImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LocationRefinementViewController"), CFSTR("_mapView"), "MKMapView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LocationRefinementViewController"), CFSTR("mapView:regionDidChangeAnimated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LocationRefinementViewController"), CFSTR("crosshairType"), "Q", 0);

}

- (void)_axAnnotateSnapToUserLocationButton
{
  void *v2;
  id v3;

  -[LocationRefinementViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_snapToUserLocationButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("SNAP_TO_USER_LOCATION_BUTTON"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LocationRefinementViewControllerAccessibility;
  -[LocationRefinementViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[LocationRefinementViewControllerAccessibility _axAnnotateSnapToUserLocationButton](self, "_axAnnotateSnapToUserLocationButton");
  v3 = -[LocationRefinementViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("crosshairType"));
  if (v3 > 4)
  {
    v4 = 0;
  }
  else
  {
    AXMapsLocString(off_250259098[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LocationRefinementViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_crosshairImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 1);
  objc_msgSend(v5, "setAccessibilityLabel:", v4);
  -[LocationRefinementViewControllerAccessibility _triggerCrossHairLocationDecode](self, "_triggerCrossHairLocationDecode");

}

- (void)_triggerCrossHairLocationDecode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  LocationRefinementViewControllerAccessibility *v15;
  char v16;

  -[LocationRefinementViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_crosshairImageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[LocationRefinementViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDBFA80]);
  objc_msgSend(v5, "centerCoordinate");
  v8 = v7;
  objc_msgSend(v5, "centerCoordinate");
  v9 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  v10 = objc_alloc_init(MEMORY[0x24BDBFA68]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __80__LocationRefinementViewControllerAccessibility__triggerCrossHairLocationDecode__block_invoke;
  v13[3] = &unk_250259078;
  v14 = v3;
  v15 = self;
  v11 = v3;
  v12 = (void *)MEMORY[0x234913888](v13);
  objc_msgSend(v10, "reverseGeocodeLocation:completionHandler:", v9, v12);
  -[LocationRefinementViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("CLGeocoder"));

}

void __80__LocationRefinementViewControllerAccessibility__triggerCrossHairLocationDecode__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (a3 || !v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_accessibilityRemoveValueForKey:", CFSTR("CLGeocoder"));
  }
  else
  {
    AXShortAddressDescriptionForPlacemark(v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAccessibilityValue:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_accessibilityRemoveValueForKey:", CFSTR("CLGeocoder"));

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LocationRefinementViewControllerAccessibility;
  -[LocationRefinementViewControllerAccessibility mapView:regionDidChangeAnimated:](&v5, sel_mapView_regionDidChangeAnimated_, a3, a4);
  -[LocationRefinementViewControllerAccessibility _triggerCrossHairLocationDecode](self, "_triggerCrossHairLocationDecode");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LocationRefinementViewControllerAccessibility;
  -[LocationRefinementViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[LocationRefinementViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
