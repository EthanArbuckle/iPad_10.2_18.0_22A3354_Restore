@implementation OfferPlatterComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StoreDynamicUIPlugin.OfferPlatterComponent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.OfferPlatterComponent"), CFSTR("infoLabel"), "DynamicLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.OfferPlatterComponent"), CFSTR("titleLabel"), "DynamicLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.OfferPlatterComponent"), CFSTR("subtitleLabel"), "DynamicLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("StoreDynamicUIPlugin.OfferPlatterComponent"), CFSTR("buttonView"), "DynamicButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)OfferPlatterComponentAccessibility;
  -[OfferPlatterComponentAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
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
  void *v10;
  void *v11;

  -[OfferPlatterComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("infoLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[OfferPlatterComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[OfferPlatterComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[OfferPlatterComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("buttonView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[OfferPlatterComponentAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("buttonView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfferPlatterComponentAccessibility;
  -[OfferPlatterComponentAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[OfferPlatterComponentAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
