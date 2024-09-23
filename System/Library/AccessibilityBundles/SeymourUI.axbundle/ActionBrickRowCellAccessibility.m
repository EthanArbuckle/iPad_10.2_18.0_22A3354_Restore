@implementation ActionBrickRowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.ActionBrickRowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, MEMORY[0x23491D424](CFSTR("SeymourUI.DownloadButton"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ActionBrickRowCellAccessibility _accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:](self, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", 0, 1, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityReplaceStylsticBulletsForSpeaking(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ActionBrickRowCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[ActionBrickRowCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_accessibilityCustomActions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[ActionBrickRowCellAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23491D424](CFSTR("SeymourUI.DownloadButton"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc(MEMORY[0x24BDF6788]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__ActionBrickRowCellAccessibility__accessibilityCustomActions__block_invoke;
    v8[3] = &unk_2503484B8;
    v9 = v2;
    v5 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v3, v8);
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __62__ActionBrickRowCellAccessibility__accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

@end
