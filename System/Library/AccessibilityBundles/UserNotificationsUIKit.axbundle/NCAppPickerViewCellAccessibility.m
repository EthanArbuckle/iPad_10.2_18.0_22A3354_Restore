@implementation NCAppPickerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCAppPickerViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCAppPickerViewCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCAppPickerViewCell"), CFSTR("_frequencyLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCAppPickerViewCell"), CFSTR("_checkmarkButton"), "NCCheckmarkButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NCCheckmarkButton"), CFSTR("UIControl"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[NCAppPickerViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("digest.daily.notification.average"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCAppPickerViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_frequencyLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  int v3;
  uint64_t v4;

  -[NCAppPickerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkmarkButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSelected"));

  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | *MEMORY[0x24BDF73B0];
}

@end
