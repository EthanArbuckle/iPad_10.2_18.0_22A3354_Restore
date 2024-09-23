@implementation ApplePayBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.ApplePayBubbleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ApplePayBubbleViewAccessibility;
  -[ApplePayBubbleViewAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("APPLE_PAY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ApplePayBubbleViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ApplePayBubbleViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
