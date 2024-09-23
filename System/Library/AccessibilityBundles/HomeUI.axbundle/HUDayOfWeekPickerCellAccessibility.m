@implementation HUDayOfWeekPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUDayOfWeekPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDayOfWeekPickerCell"), CFSTR("buttons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUDayOfWeekPickerCell"), CFSTR("initWithStyle: reuseIdentifier:"), "@", "q", "@", 0);

}

- (HUDayOfWeekPickerCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUDayOfWeekPickerCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUDayOfWeekPickerCellAccessibility;
  v4 = -[HUDayOfWeekPickerCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[HUDayOfWeekPickerCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUDayOfWeekPickerCellAccessibility;
  -[HUDayOfWeekPickerCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weekdaySymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_opt_class();
  -[HUDayOfWeekPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__HUDayOfWeekPickerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250234808;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

void __80__HUDayOfWeekPickerCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tag") - 1;
  if (v5 < objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

  }
}

@end
