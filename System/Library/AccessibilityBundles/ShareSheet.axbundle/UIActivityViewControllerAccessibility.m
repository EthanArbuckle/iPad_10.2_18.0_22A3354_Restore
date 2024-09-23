@implementation UIActivityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIActivityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewWillDisappear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIActivityViewController"), CFSTR("_cancel"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("UIActivityViewController"), CFSTR("UIViewController"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIActivityViewControllerAccessibility;
  -[UIActivityViewControllerAccessibility viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[UIActivityViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ActivityListView"));

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __67__UIActivityViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIActivityViewControllerAccessibility;
  -[UIActivityViewControllerAccessibility viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
