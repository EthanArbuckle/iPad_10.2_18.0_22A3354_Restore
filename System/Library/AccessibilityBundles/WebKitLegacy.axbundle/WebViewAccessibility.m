@implementation WebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContainer
{
  return (id)-[WebViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_UIKitDelegate"));
}

@end
