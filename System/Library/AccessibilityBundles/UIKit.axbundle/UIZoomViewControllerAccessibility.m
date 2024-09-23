@implementation UIZoomViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIZoomViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_fakingRequiresHighResolution"), "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)_accessibilitySetZoomButtonLabel
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;

  if (a1)
  {
    v9 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_shouldZoom"));
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((v10 & 1) != 0)
    {
      v6 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_zoomButton"));
      v5 = accessibilityLocalizedString(CFSTR("normal.zoom"));
      objc_msgSend(v6, "setAccessibilityLabel:");

    }
    else
    {
      v8 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_zoomButton"));
      v7 = accessibilityLocalizedString(CFSTR("fullscreen.zoom"));
      objc_msgSend(v8, "setAccessibilityLabel:");

    }
    v4 = (id)objc_msgSend(a1, "safeValueForKey:");
    v3 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_zoomButton"));
    v2 = (id)objc_msgSend(v3, "titleForState:", 0);
    objc_msgSend(v4, "setAccessibilityIdentifier:");

    if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeBoolForKey:", CFSTR("_fakingRequiresHighResolution")) & 1) != 0)
    {
      v1 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_zoomButton"));
      objc_msgSend(v1, "setAccessibilityElementsHidden:", 1);

    }
  }
}

- (void)loadView
{
  objc_super v2;
  SEL v3;
  UIZoomViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIZoomViewControllerAccessibility;
  -[UIZoomViewControllerAccessibility loadView](&v2, sel_loadView);
  -[UIZoomViewControllerAccessibility _accessibilitySetZoomButtonLabel](v4);
}

- (void)_changeZoom:(id)a3
{
  objc_super v3;
  id location[2];
  UIZoomViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIZoomViewControllerAccessibility;
  -[UIZoomViewControllerAccessibility _changeZoom:](&v3, sel__changeZoom_, location[0]);
  -[UIZoomViewControllerAccessibility _accessibilitySetZoomButtonLabel](v5);
  objc_storeStrong(location, 0);
}

@end
