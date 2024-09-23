@implementation SKUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftThemeBackgroundView"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUIGiftThemeCollectionView"), CFSTR("UICollectionView"));

}

- (void)accessibilityIncrement
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIPageControlAccessibility;
  -[SKUIPageControlAccessibility accessibilityIncrement](&v8, sel_accessibilityIncrement);
  -[SKUIPageControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GiftThemePageControl"));

  if (v4)
  {
    objc_opt_class();
    -[SKUIPageControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SKUIGiftThemeBackgroundView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("scrollView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "accessibilityScrollLeftPage");
  }
}

- (void)accessibilityDecrement
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIPageControlAccessibility;
  -[SKUIPageControlAccessibility accessibilityDecrement](&v8, sel_accessibilityDecrement);
  -[SKUIPageControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GiftThemePageControl"));

  if (v4)
  {
    objc_opt_class();
    -[SKUIPageControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SKUIGiftThemeBackgroundView")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("scrollView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "accessibilityScrollRightPage");
  }
}

@end
