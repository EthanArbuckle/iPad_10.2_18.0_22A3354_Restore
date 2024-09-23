@implementation CardButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CardButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CardButton"), CFSTR("_actionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CardButton"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CardButtonAccessibility;
  -[CardButtonAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CardButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "imageForState:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((MEMORY[0x234913690]() & 1) != 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "buttonType");

  if (v6 == 7)
  {
    -[CardButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("CardButtonTypeShare"));

    if (v8)
      v9 = CFSTR("SHARE_BUTTON");
    else
      v9 = CFSTR("CLOSE_BUTTON");
    AXMapsLocString(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v5);
    goto LABEL_7;
  }
LABEL_8:
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__CardButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_250259038;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

double __69__CardButtonAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;

  return v3;
}

@end
