@implementation TUIAutofillExtraCandidateCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TUIAutofillExtraCandidateCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("autofill.keyboard.button"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
