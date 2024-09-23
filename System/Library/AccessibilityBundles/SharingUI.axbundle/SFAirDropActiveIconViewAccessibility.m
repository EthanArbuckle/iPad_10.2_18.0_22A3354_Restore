@implementation SFAirDropActiveIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAirDropActiveIconView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("placeholder.view.label"));
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("placeholder.view.hint"));
}

- (id)accessibilityValue
{
  return accessibilityLocalizedString(CFSTR("placeholder.view.value"));
}

@end
