@implementation VenueFloorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VenueFloorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorViewController"), CFSTR("closeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VenueFloorViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VenueFloorViewController"), CFSTR("floorCollectionView"), "@", 0);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VenueFloorViewControllerAccessibility;
  -[VenueFloorViewControllerAccessibility loadView](&v3, sel_loadView);
  -[VenueFloorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VenueFloorViewControllerAccessibility;
  -[VenueFloorViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[VenueFloorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("closeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  AXMapsLocString(CFSTR("CLOSE_BUTTON"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  -[VenueFloorViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("floorCollectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("Level Switcher"));

}

@end
