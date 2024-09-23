@implementation SKUIGiftDateTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIGiftDateTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftDateTableViewCell"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIGiftDateTableViewCell"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftDateTableViewCell"), CFSTR("_datePicker"), "UIDatePicker");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[SKUIGiftDateTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isChecked"));
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (id)accessibilityLabel
{
  return (id)-[SKUIGiftDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SKUIGiftDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_datePicker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  return accessibilitySKUILocalizedString(CFSTR("send.gift.date.hint"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[SKUIGiftDateTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_datePicker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDescendantOfView:", self))
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIGiftDateTableViewCellAccessibility;
    -[SKUIGiftDateTableViewCellAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

@end
