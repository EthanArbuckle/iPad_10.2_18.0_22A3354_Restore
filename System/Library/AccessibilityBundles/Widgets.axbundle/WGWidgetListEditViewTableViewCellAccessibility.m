@implementation WGWidgetListEditViewTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGWidgetListEditViewTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetListEditViewTableViewCell"), CFSTR("showsDot"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibility"), CFSTR("_accessibilityCellEditingControl"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCellAccessibility"), CFSTR("_accessibilityCellReorderControl"), "@", 0);

}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = &stru_2503E8158;
  if (-[WGWidgetListEditViewTableViewCellAccessibility _axIsAddCell](self, "_axIsAddCell"))
  {
    accessibilityLocalizedString(CFSTR("add.widget"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  -[WGWidgetListEditViewTableViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("textLabel.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_2503E8158;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[WGWidgetListEditViewTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsDot")) & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("new.widget"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[WGWidgetListEditViewTableViewCellAccessibility _axIsAddCell](self, "_axIsAddCell");
  v4 = *MEMORY[0x24BEBB110];
  if (v3)
    v4 = 0;
  return v4 | v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (-[WGWidgetListEditViewTableViewCellAccessibility _axIsAddCell](self, "_axIsAddCell"))
  {
    LOBYTE(v9) = 0;
    objc_opt_class();
    -[WGWidgetListEditViewTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityCellEditingControl"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "sendActionsForControlEvents:", 64);
    v5 = 1;
  }
  else
  {
    -[WGWidgetListEditViewTableViewCellAccessibility _privateAccessibilityCustomActions](self, "_privateAccessibilityCustomActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    v4 = v7;
    AXPerformSafeBlock();
    v5 = *((_BYTE *)v10 + 24) != 0;

    _Block_object_dispose(&v9, 8);
  }

  return v5;
}

void __71__WGWidgetListEditViewTableViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessibilityCustomActionIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "_accessibilityPerformCustomActionWithIdentifier:", v3);

}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGPoint result;

  -[WGWidgetListEditViewTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityCellEditingControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WGWidgetListEditViewTableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[WGWidgetListEditViewTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityCellReorderControl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      if (!v3)
      {
        v14.receiver = self;
        v14.super_class = (Class)WGWidgetListEditViewTableViewCellAccessibility;
        -[WGWidgetListEditViewTableViewCellAccessibility accessibilityActivationPoint](&v14, sel_accessibilityActivationPoint);
        goto LABEL_11;
      }
      v6 = v3;
    }
    objc_msgSend(v6, "accessibilityActivationPoint");
LABEL_11:
    v8 = v10;
    v9 = v11;

    goto LABEL_12;
  }
  if (v3)
  {
    objc_msgSend(v3, "accessibilityActivationPoint");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WGWidgetListEditViewTableViewCellAccessibility;
    -[WGWidgetListEditViewTableViewCellAccessibility accessibilityActivationPoint](&v15, sel_accessibilityActivationPoint);
  }
  v8 = v4;
  v9 = v5;
LABEL_12:

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)_axIsAddCell
{
  void *v2;
  BOOL v3;

  -[WGWidgetListEditViewTableViewCellAccessibility _privateAccessibilityCustomActions](self, "_privateAccessibilityCustomActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

@end
