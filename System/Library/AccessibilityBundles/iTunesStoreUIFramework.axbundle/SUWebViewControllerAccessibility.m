@implementation SUWebViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUWebViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_removePlaceholderBackgroundView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUWebViewControllerAccessibility;
  -[SUWebViewControllerAccessibility _removePlaceholderBackgroundView](&v2, sel__removePlaceholderBackgroundView);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end
