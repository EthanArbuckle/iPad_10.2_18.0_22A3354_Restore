@implementation MPUEmphasizedTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPUEmphasizedText");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPUEmphasizedText"), CFSTR("string"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[MPUEmphasizedTextAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("string"));
}

@end
