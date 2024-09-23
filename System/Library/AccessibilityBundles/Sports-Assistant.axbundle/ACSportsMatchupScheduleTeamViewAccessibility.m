@implementation ACSportsMatchupScheduleTeamViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsMatchupScheduleTeamView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsMatchupScheduleTeamView"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsMatchupScheduleTeamView"), CFSTR("_recordLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ACSportsMatchupScheduleTeamViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsMatchupScheduleTeamViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recordLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
