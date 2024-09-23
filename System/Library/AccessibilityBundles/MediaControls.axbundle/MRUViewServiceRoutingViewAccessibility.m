@implementation MRUViewServiceRoutingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUViewServiceRoutingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUViewServiceRoutingView"), CFSTR("updateVisibility"), "v", 0);
}

- (void)updateVisibility
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MRUViewServiceRoutingViewAccessibility;
  -[MRUViewServiceRoutingViewAccessibility updateVisibility](&v2, sel_updateVisibility);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __58__MRUViewServiceRoutingViewAccessibility_updateVisibility__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

@end
