@implementation WKSelectSinglePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKSelectSinglePicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WKSelectSinglePicker"), CFSTR("controlBeginEditing"), "v", 0);
}

- (void)controlBeginEditing
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WKSelectSinglePickerAccessibility;
  -[WKSelectSinglePickerAccessibility controlBeginEditing](&v2, sel_controlBeginEditing);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __56__WKSelectSinglePickerAccessibility_controlBeginEditing__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindDescendant:", &__block_literal_global_1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v1);

}

uint64_t __56__WKSelectSinglePickerAccessibility_controlBeginEditing__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

@end
