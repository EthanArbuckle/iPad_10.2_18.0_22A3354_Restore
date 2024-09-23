@implementation CKAppGrabberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAppGrabberView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAppGrabberView"), CFSTR("_pluginTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAppGrabberView"), CFSTR("_closeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKAppGrabberView"), CFSTR("_chevronView"), "_UIGrabber");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKAppGrabberViewAccessibility;
  -[CKAppGrabberViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CKAppGrabberViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pluginTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);
  objc_initWeak(&location, self);
  -[CKAppGrabberViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_chevronView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__CKAppGrabberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_2501B1D30;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v7);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

id __75__CKAppGrabberViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_accessibilityBoolValueForKey:", CFSTR("_axBrowserIsExpanded"));

  if (v2)
    v3 = CFSTR("browser.collapse.button");
  else
    v3 = CFSTR("browser.expand.button");
  return accessibilityLocalizedString(v3);
}

- (CKAppGrabberViewAccessibility)initWithFrame:(CGRect)a3
{
  CKAppGrabberViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAppGrabberViewAccessibility;
  v3 = -[CKAppGrabberViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKAppGrabberViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
