@implementation WorkoutPlanBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutPlanBannerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.WorkoutPlanBannerCell"), CFSTR("UICollectionViewCell"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WorkoutPlanBannerCellAccessibility;
  -[WorkoutPlanBannerCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[WorkoutPlanBannerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

}

@end
