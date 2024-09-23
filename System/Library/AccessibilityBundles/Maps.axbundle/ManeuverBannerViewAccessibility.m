@implementation ManeuverBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ManeuverBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("leadingManeuverView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverAccessoryView"), CFSTR("maneuverView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("minimalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("minimalManeuverView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("detachedMinimalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("detachedMinimalManeuverView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("trailingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("apertureDistanceLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DistanceAccessoryView"), CFSTR("displayState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DistanceAccessoryView"), CFSTR("previousDistanceString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ManeuverBannerView"), CFSTR("updateFromBannerItem"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindowScene"), CFSTR("systemApertureElementContext"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBUISystemApertureElementContext"), CFSTR("setElementNeedsUpdate"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ManeuverBannerView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ManeuverBannerViewAccessibility;
  -[ManeuverBannerViewAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingManeuverView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("maneuverView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimalManeuverView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("minimalView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("maneuverView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v10);

  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detachedMinimalManeuverView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detachedMinimalView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("maneuverView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v14);

  -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("apertureDistanceLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "safeIntegerForKey:", CFSTR("displayState"));
  if (v16 == 3)
  {
    -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AXMapsLocString(CFSTR("REROUTING_CELL"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v16 != 2)
    {
      -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAccessibilityLabel:", 0);
      goto LABEL_7;
    }
    -[ManeuverBannerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeValueForKey:", CFSTR("previousDistanceString"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
  objc_msgSend(v17, "setAccessibilityLabel:", v18);

LABEL_7:
}

- (void)updateFromBannerItem
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ManeuverBannerViewAccessibility;
  -[ManeuverBannerViewAccessibility updateFromBannerItem](&v6, sel_updateFromBannerItem);
  -[ManeuverBannerViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[ManeuverBannerViewAccessibility window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("systemApertureElementContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setElementNeedsUpdate");

}

@end
