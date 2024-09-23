@implementation NCSchedulerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCSchedulerViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCSchedulerViewCell"), CFSTR("_buttonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_UIDatePickerCompactTimeLabel"), CFSTR("_UIDatePickerCalendarTimeLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerCalendarTimeLabel"), CFSTR("didTapInputLabelAtLocation:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCSchedulerViewCell"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCSchedulerViewCell"), CFSTR("_datePicker"), "UIDatePicker");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIDatePicker"), CFSTR("_pickerView"), "UIView<_UIDatePickerViewComponent>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerIOSCompactView"), CFSTR("timeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCSchedulerViewCell"), CFSTR("_button"), "NCSymbolButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("NCSymbolButton"), CFSTR("_symbolImageView"), "UIImageView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;

  -[NCSchedulerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  void *v2;
  int64_t v3;

  -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityExpandedStatus");

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;
  objc_super v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)NCSchedulerViewCellAccessibility;
  -[NCSchedulerViewCellAccessibility accessibilityCustomActions](&v20, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[NCSchedulerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v7 = objc_alloc(MEMORY[0x24BDF6788]);
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_symbolImageView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __62__NCSchedulerViewCellAccessibility_accessibilityCustomActions__block_invoke;
      v15 = &unk_2503BDEB0;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      v10 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v9, &v12);

      objc_msgSend(v3, "axSafelyAddObject:", v10, v12, v13, v14, v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

  return v3;
}

uint64_t __62__NCSchedulerViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_buttonPressed:", v3);

  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");
  v4 = *MEMORY[0x24BDF73B0] | v3;

  return v4;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  void *v13;

  -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NCSchedulerViewCellAccessibility _accessibilityDatePickerView](self, "_accessibilityDatePickerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("timeView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __57__NCSchedulerViewCellAccessibility_accessibilityActivate__block_invoke;
    v12 = &unk_2503BDCC8;
    v13 = v5;
    v6 = v5;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

    return 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NCSchedulerViewCellAccessibility;
    return -[NCSchedulerViewCellAccessibility accessibilityActivate](&v8, sel_accessibilityActivate);
  }
}

uint64_t __57__NCSchedulerViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bounds");
  AX_CGRectGetCenter();
  return objc_msgSend(v1, "didTapInputLabelAtLocation:");
}

- (id)_accessibilityDatePickerView
{
  void *v3;
  void *v4;

  -[NCSchedulerViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_datePicker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    -[NCSchedulerViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_datePicker._pickerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
