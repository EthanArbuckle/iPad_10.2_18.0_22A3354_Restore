@implementation WKMultipleSelectPickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKMultipleSelectPicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKMultipleSelectPicker"), CFSTR("controlBeginEditing"), "v", 0);
}

- (void)controlBeginEditing
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WKMultipleSelectPickerAccessibility;
  -[WKMultipleSelectPickerAccessibility controlBeginEditing](&v2, sel_controlBeginEditing);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__WKMultipleSelectPickerAccessibility_controlBeginEditing__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindDescendant:", &__block_literal_global_0);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v1);

}

uint64_t __58__WKMultipleSelectPickerAccessibility_controlBeginEditing__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
