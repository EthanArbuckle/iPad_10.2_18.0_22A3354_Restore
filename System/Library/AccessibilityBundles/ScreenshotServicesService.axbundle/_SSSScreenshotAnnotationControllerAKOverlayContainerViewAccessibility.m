@implementation _SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SSSScreenshotAnnotationControllerAKOverlayContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSScreenshotsView"), CFSTR("_screenshotViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:", CFSTR("SSSScreenshotsView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SSSScreenshotView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SSSScreenshotAnnotationControllerAKOverlayContainerView"), CFSTR("managedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SSSScreenshotAnnotationControllerAKOverlayContainerView"), CFSTR("setManagedView:"), "v", "@", 0);

}

- (void)setManagedView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility;
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility setManagedView:](&v4, sel_setManagedView_, a3);
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility _axMarkupAKOverlayView](self, "_axMarkupAKOverlayView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility;
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility _axMarkupAKOverlayView](self, "_axMarkupAKOverlayView");
}

- (void)_axMarkupAKOverlayView
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("managedView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491CA08](CFSTR("AKOverlayView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(location) = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityCreateOverlayViewElement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("ScreenshotImageView"));
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __95___SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility__axMarkupAKOverlayView__block_invoke;
    v6[3] = &unk_25033B710;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

  }
}

- (id)_accessibilityLabelForOverlayView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491CA08](CFSTR("SSSScreenshotView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SSSScreenshotAnnotationControllerAKOverlayContainerViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491CA08](CFSTR("SSSScreenshotsView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_screenshotViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v5, "indexOfObject:", v3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    accessibilityLocalizedString(CFSTR("screenshot.title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("screenshot.with.index"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v9 + 1, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
