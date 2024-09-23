@implementation CertInfoSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CertInfoSheetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_pushDetailsView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CertInfoSheetViewControllerAccessibility;
  -[CertInfoSheetViewControllerAccessibility _pushDetailsView](&v2, sel__pushDetailsView);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
