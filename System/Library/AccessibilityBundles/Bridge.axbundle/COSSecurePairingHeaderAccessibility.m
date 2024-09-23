@implementation COSSecurePairingHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSSecurePairingHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSSecurePairingHeader"), CFSTR("_headerLabel"), "UILabel");
}

- (void)_axAnnotateHeaderLabel
{
  void *v2;
  id v3;

  -[COSSecurePairingHeaderAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerLabel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("secure.pairing.header.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COSSecurePairingHeaderAccessibility;
  -[COSSecurePairingHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[COSSecurePairingHeaderAccessibility _axAnnotateHeaderLabel](self, "_axAnnotateHeaderLabel");
}

- (COSSecurePairingHeaderAccessibility)initWithFrame:(CGRect)a3
{
  COSSecurePairingHeaderAccessibility *v3;
  COSSecurePairingHeaderAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COSSecurePairingHeaderAccessibility;
  v3 = -[COSSecurePairingHeaderAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[COSSecurePairingHeaderAccessibility _axAnnotateHeaderLabel](v3, "_axAnnotateHeaderLabel");
  return v4;
}

@end
