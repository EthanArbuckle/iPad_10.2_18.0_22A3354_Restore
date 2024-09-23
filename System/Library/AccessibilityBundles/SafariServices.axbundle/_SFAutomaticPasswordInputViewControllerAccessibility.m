@implementation _SFAutomaticPasswordInputViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFAutomaticPasswordInputViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFAutomaticPasswordInputViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFAutomaticPasswordInputViewController"), CFSTR("_inputView"), "UIInputView");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFAutomaticPasswordInputViewControllerAccessibility;
  -[_SFAutomaticPasswordInputViewControllerAccessibility viewWillAppear:](&v3, sel_viewWillAppear_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

@end
