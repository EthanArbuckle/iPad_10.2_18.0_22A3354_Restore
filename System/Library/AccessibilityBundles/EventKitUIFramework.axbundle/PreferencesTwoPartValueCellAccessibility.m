@implementation PreferencesTwoPartValueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PreferencesTwoPartValueCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventDateEditItem"), CFSTR("_endDateIsBeforeStartDate"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PreferencesTwoPartValueCell"), CFSTR("EKUITableViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKUITableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesTwoPartValueCell"), CFSTR("twoPartTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesTwoPartValueCell"), CFSTR("largePart2TextLabel"), "@", 0);

}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("add.event.tablecells.hint"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[PreferencesTwoPartValueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PreferencesTwoPartValueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("twoPartTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    -[PreferencesTwoPartValueCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("detailTextLabel, largePart2TextLabel"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[PreferencesTwoPartValueCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490DE60]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
