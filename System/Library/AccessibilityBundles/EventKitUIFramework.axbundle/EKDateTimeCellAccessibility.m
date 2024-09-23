@implementation EKDateTimeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKDateTimeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDateTimeCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDateTimeCell"), CFSTR("_datePicker"), "UIDatePicker");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKDateTimeCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UIDatePickerCompactDateLabel"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UIDatePickerCompactTimeLabel"));

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  __CFString *v15;
  const __CFString *v16;

  -[EKDateTimeCellAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKDateTimeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKDateTimeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_datePicker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v13 = v7;
      v15 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[EKDateTimeCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKDateTimeCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_195);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessibilityLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("__AXStringForVariablesSentinel");
      v13 = v10;
      __UIAXStringForVariables();
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[EKDateTimeCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXAddendumString"), v13, v15, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __49__EKDateTimeCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("_UIDatePickerCompactDateLabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__EKDateTimeCellAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("_UIDatePickerCompactTimeLabel"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
