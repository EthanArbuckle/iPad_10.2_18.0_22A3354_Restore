@implementation EKReminderTitleDetailCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKReminderTitleDetailCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKReminderTitleDetailCell"), CFSTR("_circle"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKReminderTitleDetailCell"), CFSTR("_title"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKReminderTitleDetailCell"), CFSTR("_subtitle"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKReminderTitleDetailCell"), CFSTR("EKEventDetailCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[EKReminderTitleDetailCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_circle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[EKReminderTitleDetailCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKReminderTitleDetailCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "CUIK_reminderShouldBeEditable"))
  {
    if (objc_msgSend(v3, "completed"))
      v4 = CFSTR("reminder.mark.incomplete.hint");
    else
      v4 = CFSTR("reminder.mark.complete.hint");
    accessibilityLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
