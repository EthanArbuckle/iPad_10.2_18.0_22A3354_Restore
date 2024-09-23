@implementation HKElectrocardiogramCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKElectrocardiogramCardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("hint.more.info"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramCardViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HKElectrocardiogramCardViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
