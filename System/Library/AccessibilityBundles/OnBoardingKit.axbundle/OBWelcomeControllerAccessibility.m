@implementation OBWelcomeControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBWelcomeController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBWelcomeController"), CFSTR("headerView"), "@", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBWelcomeControllerAccessibility;
  -[OBWelcomeControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v4 = *MEMORY[0x24BDF7328];
  -[OBWelcomeControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
