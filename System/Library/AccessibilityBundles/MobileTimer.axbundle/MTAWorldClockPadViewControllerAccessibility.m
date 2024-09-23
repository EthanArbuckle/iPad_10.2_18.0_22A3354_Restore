@implementation MTAWorldClockPadViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAWorldClockPadViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockPadViewController"), CFSTR("mapView"), "@", 0);
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAWorldClockPadViewControllerAccessibility;
  -[MTAWorldClockPadViewControllerAccessibility loadView](&v6, sel_loadView);
  -[MTAWorldClockPadViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("leftBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("clock.edit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v5);

}

- (void)updateClocksForOrientation:(int64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockPadViewControllerAccessibility;
  -[MTAWorldClockPadViewControllerAccessibility updateClocksForOrientation:](&v5, sel_updateClocksForOrientation_, a3);
  -[MTAWorldClockPadViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityRemoveSolarTerminatorPath");

}

@end
