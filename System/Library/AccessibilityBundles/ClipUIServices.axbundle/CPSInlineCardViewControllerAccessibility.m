@implementation CPSInlineCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSInlineCardViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSInlineCardViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CPSInlineCardViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSInlineCardViewControllerAccessibility;
  -[CPSInlineCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CPSInlineCardViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSInlineCardViewControllerAccessibility;
  -[CPSInlineCardViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CPSInlineCardViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
