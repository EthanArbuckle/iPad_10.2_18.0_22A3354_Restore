@implementation PSDateTimePickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSDateTimePickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSDateTimePickerCell"), CFSTR("datePicker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSDateTimePickerCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIDatePicker"), CFSTR("_pickerView"), "UIView<_UIDatePickerViewComponent>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerIOSCompactView"), CFSTR("timeView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIDatePickerCompactTimeLabel"), CFSTR("_UIDatePickerCalendarTimeLabel"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[PSDateTimePickerCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");

  return v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSDateTimePickerCellAccessibility;
  -[PSDateTimePickerCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSDateTimePickerCellAccessibility accessibilityPickerView](self, "accessibilityPickerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[PSDateTimePickerCellAccessibility accessibilityPickerTimeView](self, "accessibilityPickerTimeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityHint
{
  void *v2;
  void *v3;

  -[PSDateTimePickerCellAccessibility accessibilityPickerView](self, "accessibilityPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

  -[PSDateTimePickerCellAccessibility accessibilityPickerTimeView](self, "accessibilityPickerTimeView");
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

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[PSDateTimePickerCellAccessibility accessibilityPickerView](self, "accessibilityPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityPickerView
{
  return (id)-[PSDateTimePickerCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("datePicker._pickerView"));
}

- (id)accessibilityPickerTimeView
{
  void *v2;
  void *v3;

  -[PSDateTimePickerCellAccessibility accessibilityPickerView](self, "accessibilityPickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("timeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
