@implementation SiriUIHelpButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIHelpButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  return accessibilityLocalizedString(CFSTR("assistant.help.label"));
}

@end
