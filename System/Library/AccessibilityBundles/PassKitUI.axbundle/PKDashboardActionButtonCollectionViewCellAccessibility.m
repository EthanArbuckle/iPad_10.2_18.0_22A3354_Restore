@implementation PKDashboardActionButtonCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDashboardActionButtonCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
