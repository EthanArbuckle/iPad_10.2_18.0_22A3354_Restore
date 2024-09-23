@implementation PosterEditingConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterEditingConfirmationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.PosterEditingConfirmationViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.PosterEditingConfirmationViewController"), CFSTR("continueButton"));

}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PosterEditingConfirmationViewControllerAccessibility;
  -[PosterEditingConfirmationViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[PosterEditingConfirmationViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("continueButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
