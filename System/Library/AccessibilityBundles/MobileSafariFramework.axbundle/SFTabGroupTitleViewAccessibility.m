@implementation SFTabGroupTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFTabGroupTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFTabGroupTitleView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFTabGroupTitleView"), CFSTR("_subtitleLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  objc_opt_class();
  -[SFTabGroupTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SFTabGroupTitleViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityMobileSafariLocalizedString(CFSTR("tab.group"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
