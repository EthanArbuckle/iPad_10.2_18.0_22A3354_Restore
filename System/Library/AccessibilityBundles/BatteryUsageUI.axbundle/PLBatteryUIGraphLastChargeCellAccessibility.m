@implementation PLBatteryUIGraphLastChargeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PLBatteryUIGraphLastChargeCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUIGraphLastChargeCell"), CFSTR("_lastChargeTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUIGraphLastChargeCell"), CFSTR("_percentLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PLBatteryUIGraphLastChargeCell"), CFSTR("_timeStrLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PLBatteryUIGraphLastChargeCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PLBatteryUIGraphLastChargeCell"), CFSTR("refreshCellContentsWithSpecifier:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PLBatteryUIGraphLastChargeCellAccessibility;
  -[PLBatteryUIGraphLastChargeCellAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertyForKey:", CFSTR("PLBatteryUILastChargeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUITimestampKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "unsignedLongValue");
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isDate:inSameDayAsDate:", v9, v11);

    if (v8 >> 4 <= 0x2A2 && v12 != 0)
    {
      -[PLBatteryUIGraphLastChargeCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeStrLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      AXTimeAgoStringForTimeSince();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAccessibilityLabel:", v15);

    }
  }

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PLBatteryUIGraphLastChargeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_lastChargeTitleLabel"));
}

- (id)accessibilityValue
{
  return (id)-[PLBatteryUIGraphLastChargeCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_percentLabel, _timeStrLabel"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLBatteryUIGraphLastChargeCellAccessibility;
  -[PLBatteryUIGraphLastChargeCellAccessibility refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[PLBatteryUIGraphLastChargeCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
