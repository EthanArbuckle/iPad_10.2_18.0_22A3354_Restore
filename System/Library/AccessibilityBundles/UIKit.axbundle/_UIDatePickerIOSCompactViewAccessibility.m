@implementation _UIDatePickerIOSCompactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerIOSCompactView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = CFSTR("_UIDatePickerIOSCompactView");
  v3 = CFSTR("_UIDatePickerViewComponent");
  objc_msgSend(location[0], "validateClass:conformsToProtocol:");
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:", CFSTR("_UIDatePickerViewComponent"), CFSTR("data"));
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:", CFSTR("_UIDatePickerViewComponent"), CFSTR("datePicker"));
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDatePicker"), CFSTR("_compactStyleDelegate"), 0);
  v5 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerDataModel"), CFSTR("datePickerMode"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("dateView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("timeView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_presentation"), "_UIDatePickerOverlayPresentation");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerOverlayPresentation"), CFSTR("activeMode"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("setActiveComponent:"), "v", v5, 0);
  objc_storeStrong(v8, v7);
}

- (BOOL)isAccessibilityElement
{
  id v3;
  uint64_t v4;

  v3 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("data"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("datePickerMode"));

  return v4 != 2;
}

- (id)accessibilityElements
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;

  v6 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("data"));
  v7 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("datePickerMode"));

  if (v7 != 2)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCE30];
  v5 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dateView"));
  v4 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeView"));
  v9 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v5, v4);

  return v9;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  unint64_t v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = 0;
  v4 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("data"));
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("datePickerMode"));

  if (v5 <= 4)
    __asm { BR              X8 }
  v3 = accessibilityLocalizedString(v6[0]);
  objc_storeStrong(v6, 0);
  return v3;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13[2];
  _UIDatePickerIOSCompactViewAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  v12 = 0;
  v10 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("data"));
  v11 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("datePickerMode"));

  if (v11 == 1 || v11 == 2)
  {
    v9 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeUIViewForKey:](v14, "safeUIViewForKey:", CFSTR("_dateView"));
    v2 = (id)objc_msgSend(v9, "accessibilityLabel");
    v3 = v12;
    v12 = v2;

  }
  if (!v11 || v11 == 2)
  {
    v8 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeUIViewForKey:](v14, "safeUIViewForKey:", CFSTR("_timeView"));
    v4 = (id)objc_msgSend(v8, "accessibilityLabel");
    v5 = v13[0];
    v13[0] = v4;

  }
  v7 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  _UIDatePickerIOSCompactViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerIOSCompactViewAccessibility;
  v4 = -[_UIDatePickerIOSCompactViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
  if (-[_UIDatePickerIOSCompactViewAccessibility _accessibilityExpandedStatus](v6, "_accessibilityExpandedStatus") == 2)
    v4 |= *MEMORY[0x24BDF73B0];
  return v4;
}

- (int64_t)_accessibilityExpandedStatus
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_presentation"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("activeMode")) != 0;

  if (v4)
    return 1;
  else
    return 2;
}

- (BOOL)accessibilityActivate
{
  id v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  _UIDatePickerIOSCompactViewAccessibility *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  _UIDatePickerIOSCompactViewAccessibility *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  SEL v26;
  _UIDatePickerIOSCompactViewAccessibility *v27;
  char v28;

  v27 = self;
  v26 = a2;
  v3 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("data"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("datePickerMode"));

  v25 = v4;
  v24 = (id)-[_UIDatePickerIOSCompactViewAccessibility safeValueForKey:](v27, "safeValueForKey:", CFSTR("datePicker"));
  v23 = (id)objc_msgSend(v24, "safeValueForKey:", CFSTR("_compactStyleDelegate"));
  if (v4 == 1)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke;
    v19 = &unk_24FF3DEB0;
    v20 = v27;
    v21 = v23;
    v22 = v24;
    AXPerformSafeBlock();
    v28 = objc_opt_respondsToSelector() & 1;
    v14 = 1;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
  }
  else if (v25)
  {
    v5.receiver = v27;
    v5.super_class = (Class)_UIDatePickerIOSCompactViewAccessibility;
    v28 = -[_UIDatePickerIOSCompactViewAccessibility accessibilityActivate](&v5, sel_accessibilityActivate);
    v14 = 1;
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = -1073741824;
    v8 = 0;
    v9 = __65___UIDatePickerIOSCompactViewAccessibility_accessibilityActivate__block_invoke_2;
    v10 = &unk_24FF3DEB0;
    v11 = v27;
    v12 = v23;
    v13 = v24;
    AXPerformSafeBlock();
    v28 = objc_opt_respondsToSelector() & 1;
    v14 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  return v28 & 1;
}

@end
