@implementation NavActionCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavActionCoordinator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NavActionCoordinator"), CFSTR("sender:switchToNavigationCameraMode:"), "v", "@", "Q", 0);
}

- (void)sender:(id)a3 switchToNavigationCameraMode:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavActionCoordinatorAccessibility;
  -[NavActionCoordinatorAccessibility sender:switchToNavigationCameraMode:](&v4, sel_sender_switchToNavigationCameraMode_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
