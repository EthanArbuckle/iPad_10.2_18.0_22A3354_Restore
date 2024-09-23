@implementation SKUI_UIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUINavigationBarButtonsController"), CFSTR("_buttonItemElements"), "NSMapTable");
  objc_msgSend(v3, "validateClass:", CFSTR("SKUIButtonViewElement"));

}

- (id)_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKUI_UIViewAccessibility;
  -[SKUI_UIViewAccessibility _accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:](&v14, sel__accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v4, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SKUINavigationBarButtonsController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_buttonItemElements"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectForKey:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "accessibilityLabel");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
