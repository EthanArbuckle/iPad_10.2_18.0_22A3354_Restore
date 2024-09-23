@implementation SPUISearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUISearchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUISearchViewController"), CFSTR("cancelButtonPressed"), "v", 0);
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __67__SPUISearchViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelButtonPressed");
}

- (void)cancelButtonPressed
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SPUISearchViewControllerAccessibility;
  -[SPUISearchViewControllerAccessibility cancelButtonPressed](&v2, sel_cancelButtonPressed);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
