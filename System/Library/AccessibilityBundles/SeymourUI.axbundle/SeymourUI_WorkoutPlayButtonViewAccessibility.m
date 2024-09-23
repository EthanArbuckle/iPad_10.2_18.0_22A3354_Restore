@implementation SeymourUI_WorkoutPlayButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutPlayButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("play.button"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SeymourUI_WorkoutPlayButtonViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[SeymourUI_WorkoutPlayButtonViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BDF7408];
}

@end
