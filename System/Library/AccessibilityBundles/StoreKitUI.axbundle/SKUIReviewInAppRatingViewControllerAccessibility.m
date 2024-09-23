@implementation SKUIReviewInAppRatingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIReviewInAppRatingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIReviewInAppRatingViewController"), CFSTR("setState:"), "v", "Q", 0);
}

- (void)setState:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIReviewInAppRatingViewControllerAccessibility;
  -[SKUIReviewInAppRatingViewControllerAccessibility setState:](&v3, sel_setState_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
