@implementation SwiftUIActivityIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUIActivityIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SwiftUIActivityIndicatorView"), CFSTR("UIActivityIndicatorView"));
}

- (id)accessibilityLabel
{
  return 0;
}

@end
