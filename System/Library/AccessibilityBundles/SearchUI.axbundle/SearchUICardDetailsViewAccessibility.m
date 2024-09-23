@implementation SearchUICardDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUICardDetailsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardDetailsView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardDetailsView"), CFSTR("detailsTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchUICardDetailsView"), CFSTR("initWithTitle: details: controller:"), "@", "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICardDetailsViewAccessibility;
  -[SearchUICardDetailsViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SearchUICardDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[SearchUICardDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailsTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

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
  void *v6;
  void *v8;

  -[SearchUICardDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICardDetailsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailsTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("attributedText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (SearchUICardDetailsViewAccessibility)initWithTitle:(id)a3 details:(id)a4 controller:(id)a5
{
  SearchUICardDetailsViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICardDetailsViewAccessibility;
  v5 = -[SearchUICardDetailsViewAccessibility initWithTitle:details:controller:](&v7, sel_initWithTitle_details_controller_, a3, a4, a5);
  -[SearchUICardDetailsViewAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");

  return v5;
}

@end
