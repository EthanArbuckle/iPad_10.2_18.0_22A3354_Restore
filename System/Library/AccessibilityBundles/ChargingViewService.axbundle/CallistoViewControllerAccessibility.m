@implementation CallistoViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CallistoViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CallistoViewController"), CFSTR("showUIIfReady"), "v", 0);
}

- (void)showUIIfReady
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CallistoViewControllerAccessibility;
  -[CallistoViewControllerAccessibility showUIIfReady](&v2, sel_showUIIfReady);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
