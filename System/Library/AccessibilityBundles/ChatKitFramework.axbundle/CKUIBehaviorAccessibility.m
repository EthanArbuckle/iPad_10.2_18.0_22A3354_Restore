@implementation CKUIBehaviorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKUIBehavior");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKUIBehavior"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKUIBehavior"), CFSTR("shouldUseDynamicScrolling"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKUIBehavior"), CFSTR("shouldUseRotisserieScrolling"), "B", 0);

}

- (BOOL)shouldUseDynamicScrolling
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKUIBehaviorAccessibility;
  return -[CKUIBehaviorAccessibility shouldUseDynamicScrolling](&v4, sel_shouldUseDynamicScrolling);
}

- (BOOL)shouldUseRotisserieScrolling
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKUIBehaviorAccessibility;
  return -[CKUIBehaviorAccessibility shouldUseRotisserieScrolling](&v4, sel_shouldUseRotisserieScrolling);
}

@end
