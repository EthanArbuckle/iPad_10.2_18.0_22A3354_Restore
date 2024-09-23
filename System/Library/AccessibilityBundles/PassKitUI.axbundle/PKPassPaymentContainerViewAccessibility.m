@implementation PKPassPaymentContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPassPaymentContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPassPaymentContainerView"), CFSTR("_transitionViewsFromPayState:animated:"), "v", "q", "B", 0);
}

- (void)_transitionViewsFromPayState:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPassPaymentContainerViewAccessibility;
  -[PKPassPaymentContainerViewAccessibility _transitionViewsFromPayState:animated:](&v4, sel__transitionViewsFromPayState_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
