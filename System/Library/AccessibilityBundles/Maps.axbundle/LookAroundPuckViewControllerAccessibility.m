@implementation LookAroundPuckViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LookAroundPuckViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("LookAroundModeController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("sharedMapsDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapsAppDelegate"), CFSTR("chromeViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ChromeViewController"), CFSTR("topContext"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LookAroundModeController"), CFSTR("actionCoordinator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LookAroundActionCoordinator"), CFSTR("dataCoordinator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LookAroundPIPDataCoordinatorImpl"), CFSTR("lookAroundViewHeading"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LookAroundPuckViewController"), CFSTR("_puckView"), "LookAroundPuckView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("IOSBasedChromeViewController"), CFSTR("ChromeViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundPuckViewControllerAccessibility;
  -[LookAroundPuckViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[LookAroundPuckViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_puckView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  AXMapsLocString(CFSTR("LOOK_AROUND_PUCK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityTraits:", objc_msgSend(v3, "accessibilityTraits") & ~*MEMORY[0x24BDF73C8]);
  objc_msgSend(v3, "_setAccessibilityValueBlock:", &__block_literal_global_6);

}

id __87__LookAroundPuckViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDF6800], "safeValueForKey:", CFSTR("sharedMapsDelegate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "safeValueForKey:", CFSTR("chromeViewController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("topContext"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("LookAroundModeController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("actionCoordinator"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("dataCoordinator"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeDoubleForKey:", CFSTR("lookAroundViewHeading"));

    v5 = (void *)MEMORY[0x24BDD17C8];
    AXMapKitLocString(CFSTR("HEADING_FORMAT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXDescriptionForHeadingInDegrees();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
