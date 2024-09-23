@implementation HKWeekdayHeaderPaletteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKWeekdayHeaderPaletteView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
