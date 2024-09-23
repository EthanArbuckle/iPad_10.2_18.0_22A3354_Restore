@implementation SBFluidSwitcherTitledButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherTitledButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherTitledButton"), CFSTR("title"), "@", 0);
}

- (id)accessiblityLabel
{
  return (id)-[SBFluidSwitcherTitledButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
}

@end
