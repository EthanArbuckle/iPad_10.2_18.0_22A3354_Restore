@implementation LargeReminderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UpNext.LargeReminderView");
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
  void *v2;
  void *v3;
  void *v4;
  void *v6;

  accessibilityLocalizedString(CFSTR("reminder.title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLabelFromSortedLabelsInsideView(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("reminder.hint"));
}

@end
