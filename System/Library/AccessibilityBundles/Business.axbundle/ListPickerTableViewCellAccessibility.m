@implementation ListPickerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.ListPickerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.ListPickerTableViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.ListPickerTableViewCell"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.ListPickerTableViewCell"), CFSTR("accessibilitySelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.ListPickerTableViewCell"), CFSTR("iconImageView"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[ListPickerTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ListPickerTableViewCellAccessibility;
  v3 = -[ListPickerTableViewCellAccessibility accessibilityTraits](&v12, sel_accessibilityTraits);
  -[ListPickerTableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;
  objc_opt_class();
  -[ListPickerTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ListPickerTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilitySelected")))
  {
    if (v9)
    {
      v10 = *MEMORY[0x24BDF7400] | *MEMORY[0x24BDF73B0];
LABEL_6:
      v3 |= v10;
    }
  }
  else
  {
    if (v6 < 1.0)
    {
      v10 = *MEMORY[0x24BDF73E8];
      goto LABEL_6;
    }
    if (v9)
      v3 = v3 & ~*MEMORY[0x24BDF7400] | *MEMORY[0x24BDF73B0];
  }

  return v3;
}

- (BOOL)accessibilityRowSelected
{
  return self->_accessibilityRowSelected;
}

- (void)setAccessibilityRowSelected:(BOOL)a3
{
  self->_accessibilityRowSelected = a3;
}

@end
