@implementation WGPlatterHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGPlatterHeaderContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WGPlatterHeaderContentView"), CFSTR("PLPlatterHeaderContentView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_utilityButton"), "UIButton");
  objc_msgSend(v3, "validateClass:", CFSTR("WGWidgetPlatterView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetPlatterView"), CFSTR("isShowingMoreContent"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLPlatterHeaderContentView"), CFSTR("_configureUtilityButton"), "v", 0);

}

- (void)_configureUtilityButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGPlatterHeaderContentViewAccessibility;
  -[WGPlatterHeaderContentViewAccessibility _configureUtilityButton](&v3, sel__configureUtilityButton);
  -[WGPlatterHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGPlatterHeaderContentViewAccessibility;
  -[WGPlatterHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  -[WGPlatterHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_utilityButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __85__WGPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2503E7E88;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __85__WGPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
  }
  else
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349254B8](CFSTR("WGWidgetPlatterView")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "safeBoolForKey:", CFSTR("isShowingMoreContent")))
      v8 = CFSTR("show.less");
    else
      v8 = CFSTR("show.more");
    accessibilityLocalizedString(v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
