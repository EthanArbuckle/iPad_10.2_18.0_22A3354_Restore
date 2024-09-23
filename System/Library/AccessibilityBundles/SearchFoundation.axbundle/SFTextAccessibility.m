@implementation SFTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFText");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFText"), CFSTR("text"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[SFTextAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

@end
