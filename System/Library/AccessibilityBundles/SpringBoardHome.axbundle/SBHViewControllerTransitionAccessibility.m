@implementation SBHViewControllerTransitionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHViewControllerTransition");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHViewControllerTransition"), CFSTR("transitionDidFinish:"), "v", "@", 0);
}

- (void)transitionDidFinish:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHViewControllerTransitionAccessibility;
  -[SBHViewControllerTransitionAccessibility transitionDidFinish:](&v3, sel_transitionDidFinish_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
