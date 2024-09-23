@implementation CALayerAccessibility__UserNotificationsUI__QuartzCore

- (BOOL)hitTestsAsOpaque
{
  void *v3;
  char v4;
  objc_super v6;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[CALayerAccessibility__UserNotificationsUI__QuartzCore accessibilityIdentifier](self, "accessibilityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NCBlockTouchesViewCALayer"));

    if ((v4 & 1) != 0)
      return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CALayerAccessibility__UserNotificationsUI__QuartzCore;
  return -[CALayerAccessibility__UserNotificationsUI__QuartzCore hitTestsAsOpaque](&v6, sel_hitTestsAsOpaque);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CALayer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CALayer"), CFSTR("hitTestsAsOpaque"), "B", 0);
}

@end
