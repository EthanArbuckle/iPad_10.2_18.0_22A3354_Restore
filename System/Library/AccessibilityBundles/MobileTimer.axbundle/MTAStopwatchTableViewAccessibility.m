@implementation MTAStopwatchTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAStopwatchTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
