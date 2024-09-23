@implementation UIStatusBarBatteryItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarBatteryItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (uint64_t)_accessibilityNonQuantizedBatteryLevel
{
  if (a1)
    return __UIAccessibilityGetAssociatedInteger();
  else
    return 0;
}

- (uint64_t)_accessibilitySetNonQuantizedBatteryLevel:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedInteger();
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIStatusBarComposedData"));
  v4 = CFSTR("UIStatusBarBatteryItemView");
  v3 = "i";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarBatteryItemView"), CFSTR("_state"), "i");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIStatusBarBatteryPercentItemView"), CFSTR("_percentString"), "NSString");
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBarBatteryItemView"), CFSTR("updateForNewData: actions:"), "@", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("cachedBatteryStyle"), "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_batterySaverModeActive"), v5);
  objc_storeStrong(v7, v6);
}

- (id)_accessibilityIsBatteryPercentVisible
{
  double v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id obj;
  uint64_t v9;
  int v10;
  _QWORD __b[8];
  id v12;
  id location;
  id v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  if (a1)
  {
    v7 = (id)objc_msgSend(v14, "superview");
    location = (id)objc_msgSend(v7, "subviews");

    memset(__b, 0, sizeof(__b));
    obj = location;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    if (v9)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v9;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v12 = *(id *)(__b[1] + 8 * v5);
        NSClassFromString(CFSTR("UIStatusBarBatteryPercentItemView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "alpha");
          if (CGFAbs_1(v1) - 0.0 >= 0.000001)
            break;
        }
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
          if (!v6)
            goto LABEL_12;
        }
      }
      v15 = v12;
      v10 = 1;
    }
    else
    {
LABEL_12:
      v10 = 0;
    }

    if (!v10)
      v15 = 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SEL v13;
  UIStatusBarBatteryItemViewAccessibility *v14;
  CGPoint result;

  v14 = self;
  v13 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  -[UIStatusBarBatteryItemViewAccessibility accessibilityFrame](&v8, sel_accessibilityFrame);
  v9 = v2;
  v10 = v3;
  v11 = v4;
  v12 = v5;
  AX_CGRectGetCenter();
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double x;
  double y;
  double width;
  double height;
  id location;
  objc_super v11;
  SEL v12;
  UIStatusBarBatteryItemViewAccessibility *v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  v13 = self;
  v12 = a2;
  memset(&v14, 0, sizeof(v14));
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  -[UIStatusBarBatteryItemViewAccessibility accessibilityFrame](&v11, sel_accessibilityFrame);
  v14.origin.x = v2;
  v14.origin.y = v3;
  v14.size.width = v4;
  v14.size.height = v5;
  location = -[UIStatusBarBatteryItemViewAccessibility _accessibilityIsBatteryPercentVisible](v13);
  if (location)
  {
    objc_msgSend(location, "accessibilityFrame");
    v14 = CGRectUnion(v15, v14);
  }
  objc_storeStrong(&location, 0);
  y = v14.origin.y;
  x = v14.origin.x;
  height = v14.size.height;
  width = v14.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  float v2;
  float v3;
  double v4;
  float v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  id v17;
  id v18;
  char v19;
  char v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  int v25;
  id v26;
  float v27;
  char v28;
  id v29[2];
  UIStatusBarBatteryItemViewAccessibility *v30;
  id v31;

  v30 = self;
  v29[1] = (id)a2;
  v15 = -[UIStatusBarBatteryItemViewAccessibility _axCachedAXLabel](self);
  LOBYTE(v16) = 0;
  if (v15)
    v16 = -[UIStatusBarBatteryItemViewAccessibility _axIsCapacityDirty](v30) ^ 1;

  if ((v16 & 1) != 0)
  {
    v31 = -[UIStatusBarBatteryItemViewAccessibility _axCachedAXLabel](v30);
    return v31;
  }
  v29[0] = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v28 = objc_msgSend(v29[0], "isBatteryMonitoringEnabled") & 1;
  if (!v28)
    objc_msgSend(v29[0], "setBatteryMonitoringEnabled:", 1);
  v27 = -1.0;
  v26 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityIsBatteryPercentVisible](v30);
  if (v26)
  {
    v14 = (id)objc_msgSend(v26, "safeStringForKey:", CFSTR("_percentString"));
    v2 = (float)(int)objc_msgSend(v14, "intValue") / 100.0;
    v27 = v2;

  }
  else if ((-[UIStatusBarBatteryItemViewAccessibility _axIsCapacityDirty](v30) & 1) != 0)
  {
    v25 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityNonQuantizedBatteryLevel]((uint64_t)v30);
    v3 = (float)v25 / 100.0;
    v27 = v3;
  }
  v4 = v27;
  if (v27 <= 0.0 || (v4 = v27, v27 > 1.0))
  {
    objc_msgSend(v29[0], "batteryLevel", v4);
    v27 = v5;
  }
  v11 = (void *)MEMORY[0x24BDD17C8];
  v13 = accessibilityLocalizedString(CFSTR("status.battery.capacity"));
  v12 = (id)AXFormatFloatWithPercentage();
  v24 = (id)objc_msgSend(v11, "stringWithFormat:", v13, v12);

  v23 = objc_msgSend(v29[0], "batteryState");
  v22 = 0;
  if (v23 == 2)
  {
    v21 = -[UIStatusBarBatteryItemViewAccessibility safeIntegerForKey:](v30, "safeIntegerForKey:", CFSTR("cachedBatteryStyle"));
    if ((v21 & 1) != 0)
      v6 = accessibilityLocalizedString(CFSTR("status.battery.charging"));
    else
      v6 = accessibilityLocalizedString(CFSTR("status.not.charging"));
  }
  else
  {
    if (v23 != 3)
      goto LABEL_23;
    v19 = MGGetBoolAnswer() & 1;
    v20 = v19;
    if (v19)
      v6 = accessibilityLocalizedString(CFSTR("status.battery.charging.usb-c"));
    else
      v6 = accessibilityLocalizedString(CFSTR("status.battery.charging.lightning"));
  }
  v7 = v22;
  v22 = v6;

LABEL_23:
  v18 = 0;
  if ((-[UIStatusBarBatteryItemViewAccessibility safeBoolForKey:](v30, "safeBoolForKey:", CFSTR("_batterySaverModeActive")) & 1) != 0)
  {
    v8 = accessibilityLocalizedString(CFSTR("status.low.power.mode"));
    v9 = v18;
    v18 = v8;

  }
  if ((v28 & 1) == 0)
    objc_msgSend(v29[0], "setBatteryMonitoringEnabled:", 0);
  v17 = (id)__UIAXStringForVariables();
  -[UIStatusBarBatteryItemViewAccessibility _axSetCachedAXLabel:](v30, v17);
  v31 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v29, 0);
  return v31;
}

- (id)_axCachedAXLabel
{
  if (a1)
    return objc_getAssociatedObject(a1, &AXCachedAXLabelKey);
  else
    return 0;
}

- (uint64_t)_axIsCapacityDirty
{
  id location;
  id v3;
  char v4;

  v3 = a1;
  if (a1)
  {
    location = objc_getAssociatedObject(v3, &AXBatteryLevelIsDirtyKey);
    if (location)
      v4 = objc_msgSend(location, "BOOLValue") & 1;
    else
      v4 = 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (void)_axSetCachedAXLabel:(void *)a1
{
  id location;
  id v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    objc_setAssociatedObject(v3, &AXCachedAXLabelKey, location, (void *)1);
  objc_storeStrong(&location, 0);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarBatteryItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  return -[UIStatusBarBatteryItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  char v6;
  uint64_t v8;
  id v9[2];
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  char v17;
  int v18;
  id location[2];
  UIStatusBarBatteryItemViewAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v17 = 0;
  v16.receiver = v20;
  v16.super_class = (Class)UIStatusBarBatteryItemViewAccessibility;
  v17 = -[UIStatusBarBatteryItemViewAccessibility updateForNewData:actions:](&v16, sel_updateForNewData_actions_, location[0], a4);
  NSClassFromString(CFSTR("UIStatusBarComposedData"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x20000000;
    v13 = 32;
    v14 = 0;
    v9[1] = &v10;
    v9[0] = location[0];
    AXPerformSafeBlock();
    v8 = v11[3];
    objc_storeStrong(v9, 0);
    _Block_object_dispose(&v10, 8);
    v15 = v8;
    v4 = -[UIStatusBarBatteryItemViewAccessibility _accessibilityNonQuantizedBatteryLevel]((uint64_t)v20);
    if (v4 != *(_DWORD *)(v15 + 2104))
    {
      -[UIStatusBarBatteryItemViewAccessibility _accessibilitySetNonQuantizedBatteryLevel:]((uint64_t)v20);
      -[UIStatusBarBatteryItemViewAccessibility _axSetCapacityDirty:](v20, 1);
    }
  }
  v6 = v17;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __68__UIStatusBarBatteryItemViewAccessibility_updateForNewData_actions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "rawData");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_axSetCapacityDirty:(void *)a1
{
  id v2;

  if (a1)
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2 & 1);
    objc_setAssociatedObject(a1, &AXBatteryLevelIsDirtyKey, v2, (void *)1);

  }
}

@end
