@implementation PLBatteryUIDisplayTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLBatteryUIDisplayTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIDisplayTableCell"), CFSTR("refreshCellContentsWithSpecifier:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PLBatteryUIDisplayTableCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PLBatteryUIDisplayTableCell"), CFSTR("UITableViewCell"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PLBatteryUIDisplayTableCellAccessibility;
  -[PLBatteryUIDisplayTableCellAccessibility _accessibilityLoadAccessibilityInformation](&v17, sel__accessibilityLoadAccessibilityInformation);
  -[PLBatteryUIDisplayTableCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v5, "accessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLIconDisplayTypeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      if (v9 == 1)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v12 = v11;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v15 = v14;

        if (v12 >= 60.0 || v15 >= 60.0)
        {
          MEMORY[0x234908B50](0, v12 + v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setAccessibilityLabel:", v16);

        }
      }
    }
  }

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIDisplayTableCellAccessibility;
  -[PLBatteryUIDisplayTableCellAccessibility refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[PLBatteryUIDisplayTableCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PLBatteryUIDisplayTableCellAccessibility textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIDisplayTableCellAccessibility detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR(" —")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR(" — ")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("—")))
  {
    accessibilityLocalizedString(CFSTR("battery.app.usage.unavailable"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

@end
