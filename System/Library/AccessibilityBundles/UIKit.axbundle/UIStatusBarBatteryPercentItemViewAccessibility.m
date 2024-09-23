@implementation UIStatusBarBatteryPercentItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarBatteryPercentItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityIsBatteryItemVisible
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id obj;
  uint64_t v8;
  int v9;
  _QWORD __b[8];
  id v11;
  id location;
  id v13;
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  if (a1)
  {
    v6 = (id)objc_msgSend(v13, "superview");
    location = (id)objc_msgSend(v6, "subviews");

    memset(__b, 0, sizeof(__b));
    obj = location;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
    if (v8)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v8;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v11 = *(id *)(__b[1] + 8 * v4);
        NSClassFromString(CFSTR("UIStatusBarBatteryItemView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
          if (!v5)
            goto LABEL_11;
        }
      }
      v14 = v11;
      v9 = 1;
    }
    else
    {
LABEL_11:
      v9 = 0;
    }

    if (!v9)
      v14 = 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  BOOL v4;

  v2 = -[UIStatusBarBatteryPercentItemViewAccessibility _accessibilityIsBatteryItemVisible](self);
  v4 = v2 == 0;

  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = accessibilityLocalizedString(CFSTR("status.battery.capacity"));
  v4 = (id)-[UIStatusBarBatteryPercentItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_percentString"));
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", v5, v4);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarBatteryPercentItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBatteryPercentItemViewAccessibility;
  return -[UIStatusBarBatteryPercentItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
