@implementation MFComposeFromViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeFromView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeFromView"), CFSTR("popupButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFPopupButton"), CFSTR("label"), "@", 0);

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
  return accessibilityLocalizedString(CFSTR("from.text"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[MFComposeFromViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("popupButton.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityIdentifier
{
  return CFSTR("fromField");
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end
