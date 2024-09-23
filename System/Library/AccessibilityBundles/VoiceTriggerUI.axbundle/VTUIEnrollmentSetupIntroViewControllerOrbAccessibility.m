@implementation VTUIEnrollmentSetupIntroViewControllerOrbAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VTUIEnrollmentSetupIntroViewControllerOrb");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("VTUIEnrollmentSetupIntroViewControllerOrb"), CFSTR("UIViewController"));
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrbAccessibility;
  -[VTUIEnrollmentSetupIntroViewControllerOrbAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[VTUIEnrollmentSetupIntroViewControllerOrbAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VTUIEnrollmentSetupIntroViewControllerOrbAccessibility;
  -[VTUIEnrollmentSetupIntroViewControllerOrbAccessibility viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[VTUIEnrollmentSetupIntroViewControllerOrbAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

}

@end
