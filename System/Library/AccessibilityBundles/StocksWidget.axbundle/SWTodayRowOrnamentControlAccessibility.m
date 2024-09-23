@implementation SWTodayRowOrnamentControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SWTodayRowOrnamentControl");
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
