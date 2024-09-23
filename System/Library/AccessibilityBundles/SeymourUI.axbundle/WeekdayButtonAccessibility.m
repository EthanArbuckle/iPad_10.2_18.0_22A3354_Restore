@implementation WeekdayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WeekdayButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WeekdayButton"), CFSTR("item"), "Optional<WeekdayPickerItem>");
  objc_msgSend(v3, "validateSwiftStruct:hasSwiftField:withSwiftType:", CFSTR("SeymourUI.WeekdayPickerItem"), CFSTR("weekday"), "Weekday");

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
  void *v7;
  void *v8;
  objc_super v10;

  -[WeekdayButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("weekday"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeSwiftEnumCase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("weekday.button.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WeekdayButtonAccessibility;
    -[WeekdayButtonAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
