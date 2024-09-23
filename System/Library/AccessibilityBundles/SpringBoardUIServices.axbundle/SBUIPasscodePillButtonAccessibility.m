@implementation SBUIPasscodePillButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodePillButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodePillButton"), CFSTR("title"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  return (id)-[SBUIPasscodePillButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
}

@end
