@implementation ETContainerViewStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ETContainerViewStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ETContainerViewStatusBar"), CFSTR("PUICStatusBarAppContextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICStatusBarAppContextView"), CFSTR("navigationBackButtonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUICStatusBarAppContextView"), CFSTR("titleLabel"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ETContainerViewStatusBarAccessibility;
  -[ETContainerViewStatusBarAccessibility accessibilityElements](&v11, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETContainerViewStatusBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationBackButtonView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    -[ETContainerViewStatusBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    objc_msgSend(v8, "axSafelyAddObject:", v9);

    v3 = v8;
  }
  return v3;
}

- (BOOL)_accessibilityAutomationHitTestReverseOrder
{
  return 1;
}

@end
