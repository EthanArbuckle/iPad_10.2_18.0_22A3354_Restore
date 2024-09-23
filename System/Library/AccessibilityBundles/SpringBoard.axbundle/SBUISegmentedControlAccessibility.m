@implementation SBUISegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISegmentedControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)automationElements
{
  objc_super v4;

  if ((-[SBUISegmentedControlAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBUISegmentedControlAccessibility;
  -[SBUISegmentedControlAccessibility automationElements](&v4, sel_automationElements);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
