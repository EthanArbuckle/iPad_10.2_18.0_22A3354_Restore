@implementation RPCCUIOptionsControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RPCCUIOptionsControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("more.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RPCCUIOptionsControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[RPCCUIOptionsControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
