@implementation SRUserUtteranceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SRUserUtteranceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SRUserUtteranceView"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SRUserUtteranceViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("text"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("correction.hint"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
