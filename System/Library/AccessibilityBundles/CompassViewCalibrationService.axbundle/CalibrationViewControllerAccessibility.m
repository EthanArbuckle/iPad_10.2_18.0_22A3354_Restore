@implementation CalibrationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalibrationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CalibrationViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CalibrationViewController"), CFSTR("_instructionLabel"), "UILabel");

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CalibrationViewControllerAccessibility;
  -[CalibrationViewControllerAccessibility viewDidLoad](&v2, sel_viewDidLoad);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __53__CalibrationViewControllerAccessibility_viewDidLoad__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  id v3;

  v1 = *MEMORY[0x24BDF71E8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_instructionLabel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

@end
