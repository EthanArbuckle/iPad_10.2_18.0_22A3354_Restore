@implementation PRComplicationGalleryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRComplicationGalleryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PRComplicationGalleryViewController"), CFSTR("UIViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRComplicationGalleryViewControllerAccessibility;
  -[PRComplicationGalleryViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  v3 = *MEMORY[0x24BDF72C8];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

@end
