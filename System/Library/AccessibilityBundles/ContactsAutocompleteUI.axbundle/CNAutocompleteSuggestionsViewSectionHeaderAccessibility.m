@implementation CNAutocompleteSuggestionsViewSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAutocompleteSuggestionsViewSectionHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteSuggestionsViewSectionHeader"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteSuggestionsViewSectionHeader"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeaderAccessibility;
  -[CNAutocompleteSuggestionsViewSectionHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CNAutocompleteSuggestionsViewSectionHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (CNAutocompleteSuggestionsViewSectionHeaderAccessibility)initWithFrame:(CGRect)a3
{
  CNAutocompleteSuggestionsViewSectionHeaderAccessibility *v3;
  CNAutocompleteSuggestionsViewSectionHeaderAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAutocompleteSuggestionsViewSectionHeaderAccessibility;
  v3 = -[CNAutocompleteSuggestionsViewSectionHeaderAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CNAutocompleteSuggestionsViewSectionHeaderAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
