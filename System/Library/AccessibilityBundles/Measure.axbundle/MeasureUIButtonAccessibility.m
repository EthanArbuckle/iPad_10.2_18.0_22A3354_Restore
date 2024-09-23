@implementation MeasureUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)axIsActuallySelected
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)axSetIsActuallySelected:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsDeleteButton
{
  void *v2;
  char v3;

  -[MeasureUIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXMeasureDeleteButton"));

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  objc_super v5;

  if (-[MeasureUIButtonAccessibility _axIsDeleteButton](self, "_axIsDeleteButton"))
  {
    accessibilityLocalizedString(CFSTR("DELETE_BUTTON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MeasureUIButtonAccessibility;
    -[MeasureUIButtonAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MeasureUIButtonAccessibility;
  v3 = -[MeasureUIButtonAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if (-[MeasureUIButtonAccessibility _axIsDeleteButton](self, "_axIsDeleteButton"))
    return v3 & ~*MEMORY[0x24BDF7400] | *MEMORY[0x24BDF7408];
  if (-[MeasureUIButtonAccessibility axIsActuallySelected](self, "axIsActuallySelected"))
    v3 |= *MEMORY[0x24BDF7400];
  return v3;
}

@end
