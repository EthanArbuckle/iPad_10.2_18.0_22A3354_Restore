@implementation SwiftUIProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SwiftUIProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SwiftUIProgressView"), CFSTR("UIProgressView"));
}

- (id)accessibilityLabel
{
  return 0;
}

@end
