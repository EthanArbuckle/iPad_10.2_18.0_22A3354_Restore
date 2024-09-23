@implementation TransitDestinationBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TransitDestinationBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitDestinationBannerView"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitDestinationBannerView"), CFSTR("minimalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitDestinationBannerView"), CFSTR("detachedMinimalView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitDestinationBannerViewAccessibility;
  -[TransitDestinationBannerViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[TransitDestinationBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("MAPS_TRANSIT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[TransitDestinationBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimalView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("MAPS_TRANSIT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[TransitDestinationBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detachedMinimalView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("MAPS_TRANSIT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

@end
