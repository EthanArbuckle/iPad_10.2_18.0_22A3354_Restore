@implementation MTAAlarmCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTAAlarmCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("repeatLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("soundLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("enableSwitch"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("_editing"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("deleteTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAAlarmCollectionViewCell"), CFSTR("deleteButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
  -[MTAAlarmCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MTAAlarmCollectionViewCellAccessibility _axModifyDeleteButton](self, "_axModifyDeleteButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[MTAAlarmCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[MTAAlarmCollectionViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    -[MTAAlarmCollectionViewCellAccessibility accessibilityValue](&v6, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MTAAlarmCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enableSwitch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (unint64_t)accessibilityTraits
{
  void *v4;
  unint64_t v5;
  objc_super v6;

  if (-[MTAAlarmCollectionViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    v6.receiver = self;
    v6.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    return -[MTAAlarmCollectionViewCellAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
  else
  {
    -[MTAAlarmCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enableSwitch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityTraits");

    return v5;
  }
}

- (id)accessibilityLabel
{
  return (id)-[MTAAlarmCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("timeLabel, nameLabel, repeatLabel, soundLabel"));
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[MTAAlarmCollectionViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    accessibilityLocalizedString(CFSTR("alarm.edit.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    -[MTAAlarmCollectionViewCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGPoint result;

  if (-[MTAAlarmCollectionViewCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    v10.receiver = self;
    v10.super_class = (Class)MTAAlarmCollectionViewCellAccessibility;
    -[MTAAlarmCollectionViewCellAccessibility accessibilityActivationPoint](&v10, sel_accessibilityActivationPoint);
  }
  else
  {
    -[MTAAlarmCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("enableSwitch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityActivationPoint");
    v7 = v6;
    v9 = v8;

    v3 = v7;
    v4 = v9;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("alarm.delete"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axDeleteAlarm);

  objc_msgSend(v5, "setSortPriority:", *MEMORY[0x24BEBAD58]);
  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("alarm.toggle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__axToggleSwitch);

  v11[0] = v5;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_axModifyDeleteButton
{
  id v2;

  -[MTAAlarmCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("Delete"));

}

- (BOOL)_axDeleteAlarm
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __57__MTAAlarmCollectionViewCellAccessibility__axDeleteAlarm__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "deleteTapped:", 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)_axToggleSwitch
{
  char v2;
  id v4;
  id location;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v7 + 24);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void __58__MTAAlarmCollectionViewCellAccessibility__axToggleSwitch__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("enableSwitch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setOn:animated:", objc_msgSend(v4, "isOn") ^ 1, 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (BOOL)_axIsEditing
{
  return -[MTAAlarmCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_editing"));
}

@end
