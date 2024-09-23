@implementation LookAroundFloatingButtonsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LookAroundFloatingButtonsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LookAroundFloatingButtonsViewController"), CFSTR("setShowsMinimizedButton:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LookAroundFloatingButtonsViewController"), CFSTR("_alternateButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LookAroundFloatingButtonsViewController"), CFSTR("_menuButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LookAroundFloatingButtonsViewController"), CFSTR("_showsMinimizedButton"), "B");

}

- (void)_axUpdateButtonsLabel
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;

  -[LookAroundFloatingButtonsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alternateButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[LookAroundFloatingButtonsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsMinimizedButton")))v4 = CFSTR("LOOK_AROUND_MINIMIZE");
  else
    v4 = CFSTR("LOOK_AROUND_MAXIMIZE");
  AXMapsLocString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  -[LookAroundFloatingButtonsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_menuButton"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("LOOK_AROUND_OPTIONS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v6);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundFloatingButtonsViewControllerAccessibility;
  -[LookAroundFloatingButtonsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[LookAroundFloatingButtonsViewControllerAccessibility _axUpdateButtonsLabel](self, "_axUpdateButtonsLabel");
}

- (void)setShowsMinimizedButton:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LookAroundFloatingButtonsViewControllerAccessibility;
  -[LookAroundFloatingButtonsViewControllerAccessibility setShowsMinimizedButton:](&v4, sel_setShowsMinimizedButton_, a3);
  -[LookAroundFloatingButtonsViewControllerAccessibility _axUpdateButtonsLabel](self, "_axUpdateButtonsLabel");
}

@end
