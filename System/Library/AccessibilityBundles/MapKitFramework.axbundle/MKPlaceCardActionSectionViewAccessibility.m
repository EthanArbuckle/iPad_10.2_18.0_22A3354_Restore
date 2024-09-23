@implementation MKPlaceCardActionSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceCardActionSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlaceCardActionSectionView"), CFSTR("leftButton"), "@", 0);
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
  void *v2;
  void *v3;

  -[MKPlaceCardActionSectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
