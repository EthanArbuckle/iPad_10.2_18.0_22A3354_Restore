@implementation QLLoadingItemViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLLoadingItemViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("QLLoadingItemViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("loadViewIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("QLLoadingItemViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLLoadingItemViewController"), CFSTR("_spinner"), "UIActivityIndicatorView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("QLLoadingItemViewController"), CFSTR("_loadingLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[QLLoadingItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_loadingLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLLoadingItemViewControllerAccessibility;
  -[QLLoadingItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[QLLoadingItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_spinner"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[QLLoadingItemViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_loadingLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (void)loadViewIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QLLoadingItemViewControllerAccessibility;
  -[QLLoadingItemViewControllerAccessibility loadViewIfNeeded](&v3, sel_loadViewIfNeeded);
  -[QLLoadingItemViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
