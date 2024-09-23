@implementation WorkoutPlanScheduledItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutPlanScheduledItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  const char *v3;
  void *v4;

  -[WorkoutPlanScheduledItemCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", 0, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityReplaceStylsticBulletsForSpeaking(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WorkoutPlanScheduledItemCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[WorkoutPlanScheduledItemCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
