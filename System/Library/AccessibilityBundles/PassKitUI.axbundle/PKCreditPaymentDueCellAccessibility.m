@implementation PKCreditPaymentDueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKCreditPaymentDueCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKCreditPaymentDueCell"), CFSTR("_payButton"), "PKContinuousButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("paymentDueLabelText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("dateLabelText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("detailLabelText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCreditPaymentDueCell"), CFSTR("createSubviews"), "v", 0);

}

- (void)createSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCreditPaymentDueCellAccessibility;
  -[PKCreditPaymentDueCellAccessibility createSubviews](&v3, sel_createSubviews);
  -[PKCreditPaymentDueCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
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
  void *v7;

  -[PKCreditPaymentDueCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("paymentDueLabelText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditPaymentDueCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("dateLabelText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditPaymentDueCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("detailLabelText"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCreditPaymentDueCellAccessibility;
  -[PKCreditPaymentDueCellAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[PKCreditPaymentDueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("type"));

  if (v4 > 4)
    v5 = CFSTR("check.activity.button");
  else
    v5 = off_2502E3AB8[v4];
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCreditPaymentDueCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_payButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v6);

}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKCreditPaymentDueCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_payButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCE30];
    -[PKCreditPaymentDueCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_payButton"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

@end
