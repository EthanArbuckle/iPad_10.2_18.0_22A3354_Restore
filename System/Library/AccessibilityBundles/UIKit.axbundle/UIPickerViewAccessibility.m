@implementation UIPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPickerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIPickerView");
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIPickerView"), CFSTR("_tables"), "NSMutableArray");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("numberOfComponents"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("reloadAllComponents"), "v", 0);
  objc_storeStrong(v6, obj);
}

- (double)scrollAnimationDuration
{
  return 0.0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 38;
}

- (int64_t)_accessibilityPickerType
{
  id v3;
  unint64_t v4;

  NSClassFromString(CFSTR("_UIDatePickerView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  v3 = (id)-[UIPickerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("datePickerMode"));
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if (v4 <= 4)
    __asm { BR              X8 }
  if (v4 != 4270)
  {
    if (v4 == 4271)
      return 8;
    return 1;
  }
  return 7;
}

- (id)accessibilityElements
{
  void *v2;
  id v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD __b[8];
  id v21;
  uint64_t v22;
  id v23[2];
  UIPickerViewAccessibility *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)-[UIPickerViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v15 = (id)-[UIPickerViewAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("numberOfComponents"));
  v16 = objc_msgSend(v15, "integerValue");

  v22 = v16;
  if (!v23[0] || v22 != objc_msgSend(v23[0], "count"))
  {
    memset(__b, 0, sizeof(__b));
    obj = v23[0];
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(obj);
        v21 = *(id *)(__b[1] + 8 * v11);
        objc_msgSend(v21, "setAccessibilityContainer:", 0);
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
          if (!v12)
            break;
        }
      }
    }

    v2 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    v3 = v23[0];
    v23[0] = v2;

    -[UIPickerViewAccessibility _accessibilitySetRetainedValue:forKey:](v24, "_accessibilitySetRetainedValue:forKey:", v23[0], *MEMORY[0x24BEBB308]);
    v19 = 0;
    v7 = (id)-[UIPickerViewAccessibility safeValueForKey:](v24, "safeValueForKey:", CFSTR("numberOfComponents"));
    v8 = objc_msgSend(v7, "integerValue");

    v18 = v8;
    while (v19 < v18)
    {
      v4 = objc_allocWithZone((Class)UIAccessibilityPickerComponent);
      v17 = (id *)objc_msgSend(v4, "initWithAccessibilityContainer:", v24);
      -[UIAccessibilityPickerComponent setComponent:]((uint64_t)v17, v19);
      -[UIAccessibilityPickerComponent setPicker:](v17, v24);
      objc_msgSend(v23[0], "addObject:", v17);
      objc_storeStrong((id *)&v17, 0);
      ++v19;
    }
  }
  v6 = v23[0];
  objc_storeStrong(v23, 0);
  return v6;
}

- (void)reloadAllComponents
{
  objc_super v2;
  SEL v3;
  UIPickerViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPickerViewAccessibility;
  -[UIPickerViewAccessibility reloadAllComponents](&v2, sel_reloadAllComponents);
  -[UIPickerViewAccessibility _accessibilityRemoveValueForKey:](v4, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  UIPickerViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPickerViewAccessibility;
  v4 = -[UIPickerViewAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[UIPickerViewAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v4 = 0;
  return v4 & 1;
}

@end
