@implementation WFCompactDialogViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFCompactDialogViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFCompactDialogViewController"), CFSTR("prepareForPresentationWithCompletionHandler:"), "v", "@?", 0);
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFCompactDialogViewControllerAccessibility;
  -[WFCompactDialogViewControllerAccessibility prepareForPresentationWithCompletionHandler:](&v3, sel_prepareForPresentationWithCompletionHandler_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __90__WFCompactDialogViewControllerAccessibility_prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

@end
