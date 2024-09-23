@implementation SUUIViewElementSlideshowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIViewElementSlideshowController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIViewElementSlideshowController"), CFSTR("presentFromParentViewController:"), "v", "@", 0);
}

- (void)presentFromParentViewController:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIViewElementSlideshowControllerAccessibility;
  -[SUUIViewElementSlideshowControllerAccessibility presentFromParentViewController:](&v3, sel_presentFromParentViewController_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
