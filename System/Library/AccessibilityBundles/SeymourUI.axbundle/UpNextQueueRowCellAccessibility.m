@implementation UpNextQueueRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.UpNextQueueRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WorkoutPlanBrickItemCell"), CFSTR("subtitleLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v10;

  -[UpNextQueueRowCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UpNextQueueRowCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityReplaceStylsticBulletsForSpeaking(v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
