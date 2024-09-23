@implementation PLBatteryUISuggestionHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLBatteryUISuggestionHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

@end
