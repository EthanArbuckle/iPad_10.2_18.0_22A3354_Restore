@implementation AKSmoothPathViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKSmoothPathView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKSmoothPathView"), CFSTR("terminateStroke"), "v", 0);
}

- (void)terminateStroke
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKSmoothPathViewAccessibility;
  -[AKSmoothPathViewAccessibility terminateStroke](&v4, sel_terminateStroke);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("sketch.drawing.ended"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

@end
