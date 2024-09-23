@implementation WKWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WKWebView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 58;
}

@end
