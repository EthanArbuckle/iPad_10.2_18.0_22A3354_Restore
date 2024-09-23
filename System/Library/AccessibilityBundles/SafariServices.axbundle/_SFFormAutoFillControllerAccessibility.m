@implementation _SFFormAutoFillControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFFormAutoFillController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFFormAutoFillController"), CFSTR("fieldWillFocusWithInputSession:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_SFFormAutoFillController"), CFSTR("_autoFillInputView"), "_SFAutoFillInputView");

}

- (void)fieldWillFocusWithInputSession:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFFormAutoFillControllerAccessibility;
  -[_SFFormAutoFillControllerAccessibility fieldWillFocusWithInputSession:](&v3, sel_fieldWillFocusWithInputSession_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

@end
