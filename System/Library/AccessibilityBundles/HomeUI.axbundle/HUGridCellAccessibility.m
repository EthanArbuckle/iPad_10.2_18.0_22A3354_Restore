@implementation HUGridCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUGridCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridCell"), CFSTR("primaryState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUGridCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUGridCell"), CFSTR("_rearranging"), "BOOL");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridStatusCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUGridCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("HFAbstractControlStatusItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("HUGridServicePlaceholderCell"));
  objc_msgSend(v3, "validateClass:", CFSTR("HUGridHomeCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridCellAccessibility;
  -[HUGridCellAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    UIAXStringForAllChildren();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  objc_super v5;

  if (-[HUGridCellAccessibility _axIsActiveGridCell](self, "_axIsActiveGridCell"))
  {
    -[HUGridCellAccessibility _axServiceStateString](self, "_axServiceStateString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HUGridCellAccessibility;
    -[HUGridCellAccessibility accessibilityValue](&v5, sel_accessibilityValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_axServiceStateString
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[HUGridCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("primaryState"));
  if (v2 == 1)
  {
    v3 = CFSTR("service.cell.state.off");
  }
  else
  {
    if (v2 != 2)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("service.cell.state.on");
  }
  accessibilityHomeUILocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (-[HUGridCellAccessibility _axIsActiveGridCell](self, "_axIsActiveGridCell"))
  {
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityHomeUILocalizedString(CFSTR("grid.cell.open.controls"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__axOpenQuickControls);

    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HUGridCellAccessibility;
    -[HUGridCellAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridCellAccessibility;
  v3 = -[HUGridCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[HUGridCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_rearranging"));
  v5 = *MEMORY[0x24BEBB128];
  if (!v4)
    v5 = *MEMORY[0x24BDF73B0];
  return v5 | v3;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[HUGridCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_rearranging")))
  {
    accessibilityHomeUILocalizedString(CFSTR("grid.cell.reorder.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HUGridCellAccessibility;
    -[HUGridCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_axOpenQuickControls
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", AXOpenControlsNotification, self);

}

- (id)_accessibilitySupportGesturesAttributes
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("AXSupportedGestureTypeKey");
  v5[1] = CFSTR("AXOrbGestureMode");
  v6[0] = &unk_250242DC0;
  v6[1] = &unk_250242DD8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsActiveGridCell
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char isKindOfClass;
  char v9;
  char v10;
  char v11;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gestureRecognizers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ax_containsObjectUsingBlock:", &__block_literal_global_6);

  MEMORY[0x234911848](CFSTR("HUGridStatusCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HUGridCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234911848](CFSTR("HFAbstractControlStatusItem"));
    isKindOfClass = objc_opt_isKindOfClass();

    v9 = isKindOfClass & v6;
  }
  else
  {
    MEMORY[0x234911848](CFSTR("HUGridServicePlaceholderCell"));
    v10 = objc_opt_isKindOfClass();
    MEMORY[0x234911848](CFSTR("HUGridHomeCell"));
    v11 = objc_opt_isKindOfClass();
    if (v6)
      v9 = (v10 | v11) ^ 1;
    else
      v9 = 0;
  }
  return v9 & 1;
}

uint64_t __46__HUGridCellAccessibility__axIsActiveGridCell__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
