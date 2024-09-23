@implementation UIDatePickerWeekMonthDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDatePickerWeekMonthDayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityDatePickerComponentType
{
  unint64_t v3;
  id v4[3];
  id v5;
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14[2];
  UIDatePickerWeekMonthDayViewAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UIDatePickerWeekMonthDayViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerView")));
  v13 = (id)-[UIDatePickerWeekMonthDayViewAccessibility _accessibilityAncestorIsKindOf:](v15, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIPickerColumnView")));
  v12 = (id)objc_msgSend(v14[0], "safeValueForKey:", CFSTR("_tables"));
  v11 = (void *)objc_msgSend(v12, "indexOfObject:", v13);
  v6 = 0;
  v7 = &v6;
  v8 = 0x20000000;
  v9 = 32;
  v10 = 0;
  NSClassFromString(CFSTR("_UIDatePickerView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id)objc_msgSend(v14[0], "safeValueForKey:", CFSTR("_mode"));
    v4[1] = &v6;
    v4[0] = v5;
    v4[2] = v11;
    AXPerformSafeBlock();
    objc_storeStrong(v4, 0);
    objc_storeStrong(&v5, 0);
  }
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v3;
}

uint64_t __82__UIDatePickerWeekMonthDayViewAccessibility__accessibilityDatePickerComponentType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "calendarUnitForComponent:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
