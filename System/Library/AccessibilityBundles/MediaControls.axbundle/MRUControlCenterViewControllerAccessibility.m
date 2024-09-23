@implementation MRUControlCenterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUControlCenterViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUControlCenterViewController"), CFSTR("didSelectListState:"), "v", "@", 0);
}

- (void)didSelectListState:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUControlCenterViewControllerAccessibility;
  -[MRUControlCenterViewControllerAccessibility didSelectListState:](&v3, sel_didSelectListState_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __66__MRUControlCenterViewControllerAccessibility_didSelectListState___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
