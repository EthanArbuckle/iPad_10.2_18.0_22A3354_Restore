@implementation SUUIProductPageTableUpdateHistorySectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageTableUpdateHistorySection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageTableUpdateHistorySection"), CFSTR("_reloadHeaderView"), "v", 0);
}

- (void)_reloadHeaderView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUUIProductPageTableUpdateHistorySectionAccessibility;
  -[SUUIProductPageTableUpdateHistorySectionAccessibility _reloadHeaderView](&v2, sel__reloadHeaderView);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SUUIProductPageTableUpdateHistorySectionAccessibility__reloadHeaderView__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

@end
