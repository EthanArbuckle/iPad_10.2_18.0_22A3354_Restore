@implementation BroadwayCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BroadwayCardView");
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
  return *MEMORY[0x24BDF73C8];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("apple.card.image"));
}

@end
