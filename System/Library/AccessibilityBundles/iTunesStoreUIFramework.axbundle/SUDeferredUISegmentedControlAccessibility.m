@implementation SUDeferredUISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUDeferredUISegmentedControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_commitDeferredInterfaceUpdates
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUDeferredUISegmentedControlAccessibility;
  -[SUDeferredUISegmentedControlAccessibility _commitDeferredInterfaceUpdates](&v2, sel__commitDeferredInterfaceUpdates);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
