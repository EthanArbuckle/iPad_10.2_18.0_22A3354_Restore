@implementation CapsuleNavigationBarRegistrationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CapsuleNavigationBarRegistration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CapsuleNavigationBarRegistration"), CFSTR("_formatMenuButton"), "SFNavigationBarToggleButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CapsuleNavigationBarRegistration"), CFSTR("initWithBar:barManager:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CapsuleNavigationBarRegistration"), CFSTR("_buttonsByBarItem"), "NSMutableDictionary");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CapsuleNavigationBarRegistration"), CFSTR("_pageFormatItemState"), "Q");

}

- (CapsuleNavigationBarRegistrationAccessibility)initWithBar:(id)a3 barManager:(id)a4
{
  CapsuleNavigationBarRegistrationAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CapsuleNavigationBarRegistrationAccessibility;
  v4 = -[CapsuleNavigationBarRegistrationAccessibility initWithBar:barManager:](&v6, sel_initWithBar_barManager_, a3, a4);
  -[CapsuleNavigationBarRegistrationAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CapsuleNavigationBarRegistrationAccessibility;
  -[CapsuleNavigationBarRegistrationAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CapsuleNavigationBarRegistrationAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_formatMenuButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __91__CapsuleNavigationBarRegistrationAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_25029F1B8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v8);

  -[CapsuleNavigationBarRegistrationAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonsByBarItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_2502A4780);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v5, "className");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        _AXAssert();

      }
      accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.voicesearch"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityLabel:", v6);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __91__CapsuleNavigationBarRegistrationAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int16 v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeUnsignedIntegerForKey:", CFSTR("_pageFormatItemState"));

  if ((v2 & 0x4000) != 0)
    accessibilitySafariScribbleLocalizedString(CFSTR("buttonbar.formatMenu.distractions.hidden"));
  else
    accessibilitySafariServicesLocalizedString(CFSTR("buttonbar.formatMenu"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
