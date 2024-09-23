@implementation PKPaymentAuthorizationItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentAuthorizationItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationItemCell"), CFSTR("_arrowView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationItemCell"), CFSTR("_alertView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationItemCell"), CFSTR("_labelView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationItemCell"), CFSTR("_createSubviews"), "v", 0);

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  v3 = -[PKPaymentAuthorizationItemCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[PKPaymentAuthorizationItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_arrowView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHidden") & 1) != 0)
  {
    -[PKPaymentAuthorizationItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alertView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    if ((v6 & 1) != 0)
      return v3;
  }
  else
  {

  }
  v3 |= *MEMORY[0x24BDF73B0];
  return v3;
}

- (void)_createSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  -[PKPaymentAuthorizationItemCellAccessibility _createSubviews](&v3, sel__createSubviews);
  -[PKPaymentAuthorizationItemCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKPaymentAuthorizationItemCellAccessibility;
  -[PKPaymentAuthorizationItemCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentAuthorizationItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alertView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

  -[PKPaymentAuthorizationItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alertView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("field.required.error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  LOBYTE(location) = 0;
  -[PKPaymentAuthorizationItemCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_labelView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, v7);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__PKPaymentAuthorizationItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_2502E3938;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "_setAccessibilityLabelBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __89__PKPaymentAuthorizationItemCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = AXRequestingClient();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 == 3)
  {
    objc_msgSend(v4, "localizedCapitalizedString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

@end
