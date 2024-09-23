@implementation STUIStatusBarRoundedCornerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarRoundedCornerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("STUIStatusBarPillView"));
}

- (BOOL)_accessibilityViewIsVisible
{
  objc_super v4;

  MEMORY[0x2349217D4](CFSTR("STUIStatusBarPillView"), a2);
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarRoundedCornerViewAccessibility;
  return -[STUIStatusBarRoundedCornerViewAccessibility _accessibilityViewIsVisible](&v4, sel__accessibilityViewIsVisible);
}

@end
