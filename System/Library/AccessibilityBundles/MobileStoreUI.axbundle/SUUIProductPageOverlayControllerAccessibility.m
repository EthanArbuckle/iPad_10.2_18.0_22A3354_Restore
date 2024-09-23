@implementation SUUIProductPageOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageOverlayController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageOverlayController"), CFSTR("_showOverlayViewController"), "v", 0);
}

- (void)_showOverlayViewController
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUUIProductPageOverlayControllerAccessibility;
  -[SUUIProductPageOverlayControllerAccessibility _showOverlayViewController](&v2, sel__showOverlayViewController);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
