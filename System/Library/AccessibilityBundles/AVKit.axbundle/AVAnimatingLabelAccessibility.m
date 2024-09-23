@implementation AVAnimatingLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVAnimatingLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVAnimatingLabel"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AVAnimatingLabelAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

@end
