@implementation SUStructuredPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUStructuredPageViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityClearTable:(id)a3
{
  -[SUStructuredPageViewControllerAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
