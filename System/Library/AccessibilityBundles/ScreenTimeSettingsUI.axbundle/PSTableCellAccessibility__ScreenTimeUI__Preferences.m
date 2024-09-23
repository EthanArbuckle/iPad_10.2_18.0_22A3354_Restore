@implementation PSTableCellAccessibility__ScreenTimeUI__Preferences

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityCellEditingControl"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSIconMarginTableCell"), CFSTR("PSTableCell"));

}

- (BOOL)_accessibilityIsAlwaysAllowCell
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXAlwaysAllowSpecifierIdentification"));

  return v5;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  return -[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilitySupportsActivateAction](&v4, sel__accessibilitySupportsActivateAction);
}

- (BOOL)accessibilityActivate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  if (!-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell"))goto LABEL_16;
  LOBYTE(v35) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "editingStyle");
  if (v4 == 1)
  {
    LOBYTE(v35) = 0;
    objc_opt_class();
    objc_msgSend(v3, "_tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_swipeActionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_255FEC4A8))
    {
      objc_msgSend(v3, "_accessibilityIndexPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v7, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "actions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count") == 1)
        {
          objc_msgSend(v13, "actions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "style");

          if (v17 == 1)
          {
            objc_msgSend(v13, "actions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = 0;
            v36 = &v35;
            v37 = 0x2020000000;
            v38 = 0;
            v22 = MEMORY[0x24BDAC760];
            v23 = 3221225472;
            v24 = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke_2;
            v25 = &unk_2503362C8;
            v26 = v19;
            v27 = v3;
            v28 = &v35;
            AXPerformSafeBlock();
            v8 = *((unsigned __int8 *)v36 + 24);

            _Block_object_dispose(&v35, 8);
            goto LABEL_5;
          }
        }
        else
        {

        }
      }

    }
    goto LABEL_15;
  }
  if (v4 != 2)
  {
LABEL_15:

LABEL_16:
    v21.receiver = self;
    v21.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    return -[PSTableCellAccessibility__ScreenTimeUI__Preferences accessibilityActivate](&v21, sel_accessibilityActivate);
  }
  objc_opt_class();
  -[PSTableCellAccessibility__ScreenTimeUI__Preferences safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityCellEditingControl"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __76__PSTableCellAccessibility__ScreenTimeUI__Preferences_accessibilityActivate__block_invoke;
  v32 = &unk_250336278;
  v7 = v6;
  v33 = v7;
  v34 = &v35;
  AXPerformSafeBlock();
  v8 = *((unsigned __int8 *)v36 + 24);

  _Block_object_dispose(&v35, 8);
LABEL_5:

  v9 = v8 != 0;
  return v9;
}

- (id)_privateAccessibilityCustomActions
{
  objc_super v4;

  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell"))
  {
    return MEMORY[0x24BDBD1A8];
  }
  v4.receiver = self;
  v4.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  -[PSTableCellAccessibility__ScreenTimeUI__Preferences _privateAccessibilityCustomActions](&v4, sel__privateAccessibilityCustomActions);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  objc_super v8;
  char v9;

  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell"))
  {
    v9 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "editingStyle");

    if (v4 == 1)
    {
      v5 = CFSTR("remove.always.allowed.hint");
      goto LABEL_7;
    }
    if (v4 == 2)
    {
      v5 = CFSTR("add.always.allowed.hint");
LABEL_7:
      accessibilityLocalizedString(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  -[PSTableCellAccessibility__ScreenTimeUI__Preferences accessibilityHint](&v8, sel_accessibilityHint);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_axSpecifier
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityIsSTUIExpanded
{
  void *v2;
  char v3;

  -[PSTableCellAccessibility__ScreenTimeUI__Preferences _axSpecifier](self, "_axSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsExpandedSTUICell");

  return v3;
}

- (BOOL)_accessibilityIsSTUIExpandable
{
  void *v2;
  char v3;

  -[PSTableCellAccessibility__ScreenTimeUI__Preferences _axSpecifier](self, "_axSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsExpandableSTUICell");

  return v3;
}

- (id)accessibilityValue
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsSTUIExpanded](self, "_accessibilityIsSTUIExpanded"))
  {
    v3 = CFSTR("time.selection.cell.expanded");
  }
  else
  {
    if (!-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsSTUIExpandable](self, "_accessibilityIsSTUIExpandable"))
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = CFSTR("time.selection.cell.collapsed");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8.receiver = self;
  v8.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
  -[PSTableCellAccessibility__ScreenTimeUI__Preferences accessibilityValue](&v8, sel_accessibilityValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  uint64_t v4;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  objc_super v9;
  objc_super v10;
  char v11;

  if (-[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsAlwaysAllowCell](self, "_accessibilityIsAlwaysAllowCell")&& (v11 = 0, objc_opt_class(), __UIAccessibilityCastAsClass(), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "editingStyle"), v3, v4))
  {
    v10.receiver = self;
    v10.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    return *MEMORY[0x24BDF73B0] | -[PSTableCellAccessibility__ScreenTimeUI__Preferences accessibilityTraits](&v10, sel_accessibilityTraits);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PSTableCellAccessibility__ScreenTimeUI__Preferences;
    v6 = -[PSTableCellAccessibility__ScreenTimeUI__Preferences accessibilityTraits](&v9, sel_accessibilityTraits);
    v7 = -[PSTableCellAccessibility__ScreenTimeUI__Preferences _accessibilityIsSTUIExpandable](self, "_accessibilityIsSTUIExpandable");
    v8 = *MEMORY[0x24BDF73B0];
    if (!v7)
      v8 = 0;
    return v8 | v6;
  }
}

@end
