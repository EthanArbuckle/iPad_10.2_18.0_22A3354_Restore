@implementation CycleHistoryFilterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.CycleHistoryFilterCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
