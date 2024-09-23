@implementation NavManeuverReroutingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NavManeuverReroutingCell");
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
  return AXMapsLocString(CFSTR("REROUTING_CELL"));
}

@end
