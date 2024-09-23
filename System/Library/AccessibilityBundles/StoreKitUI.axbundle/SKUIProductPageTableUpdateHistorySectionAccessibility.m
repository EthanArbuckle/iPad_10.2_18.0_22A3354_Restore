@implementation SKUIProductPageTableUpdateHistorySectionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIProductPageTableUpdateHistorySection");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIProductPageTableUpdateHistorySection"), CFSTR("_reloadHeaderView"), "v", 0);
}

- (void)_reloadHeaderView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SKUIProductPageTableUpdateHistorySectionAccessibility;
  -[SKUIProductPageTableUpdateHistorySectionAccessibility _reloadHeaderView](&v2, sel__reloadHeaderView);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SKUIProductPageTableUpdateHistorySectionAccessibility__reloadHeaderView__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

@end
