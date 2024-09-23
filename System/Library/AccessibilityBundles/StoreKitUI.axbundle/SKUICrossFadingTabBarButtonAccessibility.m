@implementation SKUICrossFadingTabBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUICrossFadingTabBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUICrossFadingTabBarButton"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUICrossFadingTabBarButton"), CFSTR("_standardTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUICrossFadingTabBarButton"), CFSTR("_selectedTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:", CFSTR("SKUICrossFadingTabBar"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUICrossFadingTabBar"), CFSTR("tabBarButtons"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SKUICrossFadingTabBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_standardTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  unint64_t v12;

  objc_opt_class();
  -[SKUICrossFadingTabBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_standardTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SKUICrossFadingTabBarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_selectedTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x24BEBB188];
  objc_msgSend(v6, "alpha");
  v9 = v8;
  objc_msgSend(v4, "alpha");
  v10 = *MEMORY[0x24BDF7400];
  if (v9 <= v11)
    v10 = 0;
  v12 = v10 | v7;

  return v12;
}

- (_NSRange)accessibilityRowRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  objc_opt_class();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("tabBarButtons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "indexOfObject:", self);
  v8 = objc_msgSend(v6, "count");

  v9 = v7;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

@end
