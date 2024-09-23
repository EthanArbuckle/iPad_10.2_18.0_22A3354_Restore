@implementation HistoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.HistoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

@end
