@implementation PLUIImageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLUIImageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)cropOverlayWasOKed:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLUIImageViewControllerAccessibility;
  -[PLUIImageViewControllerAccessibility cropOverlayWasOKed:](&v3, sel_cropOverlayWasOKed_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
