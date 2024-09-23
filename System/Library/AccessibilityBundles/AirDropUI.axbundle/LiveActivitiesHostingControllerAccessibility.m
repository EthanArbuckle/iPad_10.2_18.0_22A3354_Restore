@implementation LiveActivitiesHostingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TtGC9AirDropUI31LiveActivitiesHostingControllerVS_14AirDropPlatter_");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_TtGC9AirDropUI31LiveActivitiesHostingControllerVS_14AirDropPlatter_"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LiveActivitiesHostingControllerAccessibility;
  -[LiveActivitiesHostingControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDF7328];
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

@end
