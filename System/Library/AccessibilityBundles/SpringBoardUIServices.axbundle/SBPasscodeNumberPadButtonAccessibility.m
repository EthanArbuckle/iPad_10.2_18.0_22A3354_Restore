@implementation SBPasscodeNumberPadButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBPasscodeNumberPadButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73F0] | *MEMORY[0x24BDF73D0];
}

- (BOOL)_accessibilitySupportsDirectioOrbManipulation
{
  return 0;
}

@end
