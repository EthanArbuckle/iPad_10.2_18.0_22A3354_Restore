@implementation PLBatteryUITimeUsageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLBatteryUITimeUsageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("_screenOnText"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("_screenOffText"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("_screenOnTimeText"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("_screenOffTimeText"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUITimeUsageCell"), CFSTR("refreshCellContentsWithSpecifier:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PLBatteryUITimeUsageCellAccessibility;
  -[PLBatteryUITimeUsageCellAccessibility _accessibilityLoadAccessibilityInformation](&v27, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("PLBatteryUIGraphScreenOnUsageTimeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "propertyForKey:", CFSTR("PLBatteryUIGraphScreenOffUsageTimeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUITimeUsageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_screenOnText"));
  v9 = objc_claimAutoreleasedReturnValue();
  -[PLBatteryUITimeUsageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_screenOnTimeText"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234908B50](0, (double)v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  v12 = objc_alloc(MEMORY[0x24BEBADA8]);
  v25 = (void *)v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithAccessibilityContainer:representedElements:", self, v13);

  objc_msgSend(v14, "representedElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
    objc_msgSend(v8, "addObject:", v14);
  -[PLBatteryUITimeUsageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_screenOffText"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUITimeUsageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_screenOffTimeText"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234908B50](0, (double)v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityLabel:", v19);

  v20 = objc_alloc(MEMORY[0x24BEBADA8]);
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithAccessibilityContainer:representedElements:", self, v21);

  objc_msgSend(v22, "representedElements");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
    objc_msgSend(v8, "addObject:", v22);
  -[PLBatteryUITimeUsageCellAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v8);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUITimeUsageCellAccessibility;
  -[PLBatteryUITimeUsageCellAccessibility refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[PLBatteryUITimeUsageCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
