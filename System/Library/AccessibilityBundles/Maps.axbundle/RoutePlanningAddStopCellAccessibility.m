@implementation RoutePlanningAddStopCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RoutePlanningAddStopCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("RoutePlanningAddStopCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RoutePlanningAddStopCell"), CFSTR("isEnabled"), "B", 0);

}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[RoutePlanningAddStopCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEnabled"));
  v4 = *MEMORY[0x24BDF73E8];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

@end
