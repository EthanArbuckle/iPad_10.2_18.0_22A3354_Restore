@implementation MRPlatterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRPlatterViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRPlatterViewController"), CFSTR("headerViewButtonPressed:"), "v", "@", 0);
}

- (void)headerViewButtonPressed:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRPlatterViewControllerAccessibility;
  -[MRPlatterViewControllerAccessibility headerViewButtonPressed:](&v3, sel_headerViewButtonPressed_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
