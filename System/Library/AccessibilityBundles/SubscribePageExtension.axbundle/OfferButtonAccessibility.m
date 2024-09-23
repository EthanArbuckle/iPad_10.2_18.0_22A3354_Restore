@implementation OfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SubscribePageExtension.OfferButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SubscribePageExtension.OfferButton"), CFSTR("label"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SubscribePageExtension.OfferButton"), CFSTR("subtitleLabel"), "DynamicTypeLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfferButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[OfferButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[OfferButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
