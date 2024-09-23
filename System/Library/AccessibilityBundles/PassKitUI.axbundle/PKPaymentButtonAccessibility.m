@implementation PKPaymentButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentButton"), CFSTR("_type"), "q");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;

  -[PKPaymentButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPaymentButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PKPaymentButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    switch(v6)
    {
      case 1:
        v7 = CFSTR("buy.apple.pay.button");
        break;
      case 3:
        v7 = CFSTR("pay.apple.pay.button");
        break;
      case 4:
        v7 = CFSTR("donate.button");
        break;
      default:
        v7 = CFSTR("apple.pay.button");
        break;
    }
    accessibilityLocalizedString(v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
