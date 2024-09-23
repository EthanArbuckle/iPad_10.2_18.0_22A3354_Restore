@implementation SBUIControllerAccessibility

- (void)updateBatteryState:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  UIAccessibilityNotifications v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[SBUIControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("batteryCapacityAsPercentage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue") > 20;

  v12.receiver = self;
  v12.super_class = (Class)SBUIControllerAccessibility;
  -[SBUIControllerAccessibility updateBatteryState:](&v12, sel_updateBatteryState_, v4);

  -[SBUIControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("batteryCapacityAsPercentage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (((v6 ^ (v8 < 21)) & 1) == 0)
  {
    v9 = v8 < 21;
    v10 = *MEMORY[0x24BEBB028];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v10, v11);

  }
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityIsAppSwitcherVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityValueForKey:", CFSTR("accessibilityIsAppSwitcherVisible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && (objc_msgSend(v2, "BOOLValue") & 1) != 0;

  return v4;
}

@end
