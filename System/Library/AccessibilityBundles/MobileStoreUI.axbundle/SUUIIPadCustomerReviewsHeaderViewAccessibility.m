@implementation SUUIIPadCustomerReviewsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIIPadCustomerReviewsHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SUUIIPadCustomerReviewsHeaderViewAccessibility)initWithClientContext:(id)a3
{
  SUUIIPadCustomerReviewsHeaderViewAccessibility *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIIPadCustomerReviewsHeaderViewAccessibility;
  v3 = -[SUUIIPadCustomerReviewsHeaderViewAccessibility initWithClientContext:](&v6, sel_initWithClientContext_, a3);
  -[SUUIIPadCustomerReviewsHeaderViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

  return v3;
}

@end
