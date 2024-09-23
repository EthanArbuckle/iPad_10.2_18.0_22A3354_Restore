@implementation UIDatePickerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDatePickerContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  objc_super v30;
  id location[2];
  UIDatePickerContentViewAccessibility *v32;
  id v33;

  v32 = self;
  location[1] = (id)a2;
  v30.receiver = self;
  v30.super_class = (Class)UIDatePickerContentViewAccessibility;
  location[0] = -[UIDatePickerContentViewAccessibility accessibilityLabel](&v30, sel_accessibilityLabel);
  if (!location[0])
  {
    v23 = (id)-[UIDatePickerContentViewAccessibility safeValueForKey:](v32, "safeValueForKey:", CFSTR("titleLabel"));
    v2 = (id)objc_msgSend(v23, "accessibilityLabel");
    v3 = location[0];
    location[0] = v2;

  }
  v29 = (id)-[UIDatePickerContentViewAccessibility _accessibilityAncestorIsKindOf:](v32, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerView")));
  if (v29)
  {
    v21 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("datePickerMode"));
    v22 = objc_msgSend(v21, "unsignedIntValue");

    v27 = v22;
    v26 = -[UIDatePickerContentViewAccessibility _accessibilityDatePickerComponentType](v32, "_accessibilityDatePickerComponentType");
    v25 = 0;
    if (v22 == 3)
    {
      if (v26 == 32)
      {
        v20 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("_hourLabel"));
        v4 = (id)objc_msgSend(v20, "accessibilityLabel");
        v5 = v25;
        v25 = v4;

      }
      else if (v26 == 64)
      {
        v19 = (id)objc_msgSend(v29, "safeValueForKey:", CFSTR("_minuteLabel"));
        v6 = (id)objc_msgSend(v19, "accessibilityLabel");
        v7 = v25;
        v25 = v6;

      }
      if (v25)
      {
        v17 = (void *)MEMORY[0x24BDD17C8];
        v18 = accessibilityLocalizedString(CFSTR("date.picker.row.format"));
        v33 = (id)objc_msgSend(v17, "stringWithFormat:", location[0], v25);

      }
      else
      {
        v33 = location[0];
      }
      v28 = 1;
      goto LABEL_26;
    }
    if (v27 && v27 != 2)
    {
      if (v27 == 1)
      {
        v33 = location[0];
        v28 = 1;
LABEL_26:
        objc_storeStrong(&v25, 0);
        goto LABEL_27;
      }
    }
    else
    {
      v24 = 0;
      if (v26 == 32)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = accessibilityLocalizedString(CFSTR("date.picker.hours"));
        v8 = (id)objc_msgSend(v15, "stringWithFormat:", location[0]);
        v9 = v24;
        v24 = v8;

      }
      else if (v26 == 64)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        v14 = accessibilityLocalizedString(CFSTR("date.picker.minutes"));
        v10 = (id)objc_msgSend(v13, "localizedStringWithFormat:", v14, objc_msgSend(location[0], "integerValue"));
        v11 = v24;
        v24 = v10;

      }
      if (v24)
        objc_storeStrong(location, v24);
      objc_storeStrong(&v24, 0);
    }
    v33 = location[0];
    v28 = 1;
    goto LABEL_26;
  }
  v33 = location[0];
  v28 = 1;
LABEL_27:
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v33;
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
  UIDatePickerContentViewAccessibility *v15;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UIDatePickerContentViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerView")));
  v13 = (id)-[UIDatePickerContentViewAccessibility _accessibilityAncestorIsKindOf:](v15, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIPickerColumnView")));
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

uint64_t __77__UIDatePickerContentViewAccessibility__accessibilityDatePickerComponentType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "calendarUnitForComponent:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  id v4;
  id v5;
  char v6;
  id location;
  unint64_t v8;
  SEL v9;
  UIDatePickerContentViewAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  v4 = (id)-[UIDatePickerContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("textColor"));

  v5 = (id)-[UIDatePickerContentViewAccessibility _accessibilityValueForKey:](v10, "_accessibilityValueForKey:", CFSTR("SelectedColor"));
  v6 = UIAccessibilityColorEqualToColor();

  if ((v6 & 1) != 0)
    v8 |= *MEMORY[0x24BDF7400];
  v3 = v8;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
