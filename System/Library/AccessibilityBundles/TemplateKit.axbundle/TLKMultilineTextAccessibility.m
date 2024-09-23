@implementation TLKMultilineTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKMultilineText");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKMultilineText"), CFSTR("text"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[TLKMultilineTextAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

@end
