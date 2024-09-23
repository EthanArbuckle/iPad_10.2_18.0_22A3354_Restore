@implementation PKIdentityHeroViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKIdentityHeroViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKIdentityHeroViewControllerAccessibility;
  -[PKIdentityHeroViewControllerAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
