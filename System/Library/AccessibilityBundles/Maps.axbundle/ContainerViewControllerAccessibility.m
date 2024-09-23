@implementation ContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContainerViewController"), CFSTR("presentController: animated: useDefaultContaineeLayout:"), "v", "@", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ContainerViewController"), CFSTR("_currentViewController"), "UIViewController<ContaineeProtocol>");

}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  UIAccessibilityNotifications v11;
  void *v12;
  objc_super v13;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[ContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentViewController"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)ContainerViewControllerAccessibility;
  -[ContainerViewControllerAccessibility presentController:animated:useDefaultContaineeLayout:](&v13, sel_presentController_animated_useDefaultContaineeLayout_, v8, v6, v5);
  if (v9 != v8)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDF7328];
    objc_msgSend(v10, "_accessibilityFirstNonGrabberElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v11, v12);

  }
}

@end
