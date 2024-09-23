@implementation EKEventEditViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventEditViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventEditViewController"), CFSTR("cancelEditingWithDelegateNotification:forceCancel:"), "v", "B", "B", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __68__EKEventEditViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelEditingWithDelegateNotification:forceCancel:", 1, 0);
}

@end
