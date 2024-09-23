@implementation CompactTextAlignmentControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PaperKit.CompactTextAlignmentControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("text.alignment"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
