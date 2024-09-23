@implementation TextStyleEditingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PaperKit.TextStyleEditingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PaperKit.TextStyleEditingView"), CFSTR("fontNameControl"), "FontAttributeStylingControl");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PaperKit.TextStyleEditingView"), CFSTR("fontSizeControl"), "FontAttributeStylingControl");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TextStyleEditingViewAccessibility;
  -[TextStyleEditingViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[TextStyleEditingViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("fontNameControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("text.font"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[TextStyleEditingViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("fontSizeControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("text.size"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

@end
