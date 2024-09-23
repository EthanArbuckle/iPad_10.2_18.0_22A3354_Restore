@implementation SFAirDropIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAirDropIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("tap.to.turn.on.button"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
