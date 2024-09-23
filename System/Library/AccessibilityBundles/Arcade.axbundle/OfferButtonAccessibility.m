@implementation OfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.OfferButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("accessibilityShowRedownload"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("accessibilityShowLoading"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("accessibilityShowProgress:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("accessibilityShowText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Arcade.OfferButton"), CFSTR("accessibilityOfferLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Arcade.OfferButton"), CFSTR("label"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Arcade.OfferButton"), CFSTR("subtitleLabel"), "DynamicTypeLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfferButtonAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[OfferButtonAccessibility accessibilityTraits](&v5, sel_accessibilityTraits) | *MEMORY[0x24BDF7430];
  if (-[OfferButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled")))
    return v3 & ~*MEMORY[0x24BDF73E8];
  else
    return *MEMORY[0x24BDF73E8] | v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v3 == 0;
  else
    v8 = 1;
  if (v8)
  {

LABEL_9:
    objc_msgSend(v3, "localizedLowercaseString");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v4, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "containsString:", v9);

  if (!v10)
    goto LABEL_9;
  __UIAXStringForVariables();
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)v11;

  return v12;
}

- (OfferButtonAccessibility)initWithFrame:(CGRect)a3
{
  OfferButtonAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfferButtonAccessibility;
  v3 = -[OfferButtonAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[OfferButtonAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)accessibilityShowRedownload
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityShowRedownload](&v3, sel_accessibilityShowRedownload);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[OfferButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", 0);
  -[OfferButtonAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", 0);
}

- (void)accessibilityShowLoading
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityShowLoading](&v4, sel_accessibilityShowLoading);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  accessibilityAppStoreLocalizedString(CFSTR("cancel.download.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v3);

  -[OfferButtonAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", 0);
}

- (void)accessibilityShowProgress:(double)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityShowProgress:](&v6, sel_accessibilityShowProgress_);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  accessibilityAppStoreLocalizedString(CFSTR("cancel.download.hint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v4);

  AXFormatFloatWithPercentage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OfferButtonAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v5);

}

- (void)accessibilityShowText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OfferButtonAccessibility;
  -[OfferButtonAccessibility accessibilityShowText:](&v4, sel_accessibilityShowText_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[OfferButtonAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", 0);
  -[OfferButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", 0);
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[OfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234906688](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
