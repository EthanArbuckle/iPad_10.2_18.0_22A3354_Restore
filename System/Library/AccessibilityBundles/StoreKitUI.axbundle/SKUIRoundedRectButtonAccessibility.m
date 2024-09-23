@implementation SKUIRoundedRectButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIRoundedRectButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIAccountButtonsView"), CFSTR("_accountCreditsLabel"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  objc_super v9;

  -[SKUIRoundedRectButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SKUIAccountButtonsView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_accountCreditsLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)SKUIRoundedRectButtonAccessibility;
  -[SKUIRoundedRectButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_accessibilityViewIsVisible") & 1) != 0)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
