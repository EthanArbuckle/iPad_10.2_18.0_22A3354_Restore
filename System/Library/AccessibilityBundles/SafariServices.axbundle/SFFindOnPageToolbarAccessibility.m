@implementation SFFindOnPageToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFFindOnPageToolbar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFindOnPageToolbar"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFFindOnPageToolbar"), CFSTR("_previousButtonItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFFindOnPageToolbar"), CFSTR("_nextButtonItem"), "UIBarButtonItem");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFFindOnPageToolbarAccessibility;
  -[SFFindOnPageToolbarAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[SFFindOnPageToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previousButtonItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("find.on.page.previous"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SFFindOnPageToolbarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nextButtonItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilitySafariServicesLocalizedString(CFSTR("find.on.page.next"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFFindOnPageToolbarAccessibility;
  -[SFFindOnPageToolbarAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SFFindOnPageToolbarAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
