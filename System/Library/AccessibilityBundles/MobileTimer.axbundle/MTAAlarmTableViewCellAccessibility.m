@implementation MTAAlarmTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAlarmTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAlarm"), CFSTR("repeatSchedule"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAlarm"), CFSTR("isSleepAlarm"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAlarm"), CFSTR("displayTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTAAlarmTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewCell"), CFSTR("digitalClockLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewCell"), CFSTR("enabledSwitch"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewCell"), CFSTR("refreshUI:animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmTableViewController"), CFSTR("showEditViewForRow:"), "v", "q", 0);

}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  -[MTAAlarmTableViewCellAccessibility _axEnabledSwitch](self, "_axEnabledSwitch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    -[MTAAlarmTableViewCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  v6 = v4;
  v7 = v5;

  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTAAlarmTableViewCellAccessibility;
  v3 = -[MTAAlarmTableViewCellAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[MTAAlarmTableViewCellAccessibility _axEnabledSwitch](self, "_axEnabledSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  v6 = *MEMORY[0x24BEBB1A8];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[MTAAlarmTableViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    accessibilityLocalizedString(CFSTR("alarm.edit.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    -[MTAAlarmTableViewCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[MTAAlarmTableViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmTableViewCellAccessibility;
    -[MTAAlarmTableViewCellAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTAAlarmTableViewCellAccessibility _axEnabledSwitch](self, "_axEnabledSwitch");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (void)_axSetDetailLabelForAlarm:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "safeUnsignedIntegerForKey:", CFSTR("repeatSchedule"));
  DateMaskToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__MTAAlarmTableViewCellAccessibility__axSetDetailLabelForAlarm___block_invoke;
  v8[3] = &unk_2502B7060;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v9 = v6;
  v7 = v5;
  v10 = v7;
  -[MTAAlarmTableViewCellAccessibility _setAccessibilityLabelBlock:](self, "_setAccessibilityLabelBlock:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

id __64__MTAAlarmTableViewCellAccessibility__axSetDetailLabelForAlarm___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("digitalClockLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isSleepAlarm"));
  if ((v5 & 1) != 0)
  {
    v6 = &stru_2502B83A0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "safeStringForKey:", CFSTR("displayTitle"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) == 0)

  return v7;
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("alarm.edit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v11 = &unk_2502B70B0;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, &v8);

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "row");
  objc_msgSend(WeakRetained, "_accessibilityScrollParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __64__MTAAlarmTableViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showEditViewForRow:", *(_QWORD *)(a1 + 40));
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MTAAlarmTableViewCellAccessibility;
  v6 = a3;
  -[MTAAlarmTableViewCellAccessibility refreshUI:animated:](&v7, sel_refreshUI_animated_, v6, v4);
  -[MTAAlarmTableViewCellAccessibility _axSetDetailLabelForAlarm:](self, "_axSetDetailLabelForAlarm:", v6, v7.receiver, v7.super_class);

}

- (id)_axEnabledSwitch
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[MTAAlarmTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enabledSwitch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axIsEditing
{
  return -[MTAAlarmTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing"));
}

@end
