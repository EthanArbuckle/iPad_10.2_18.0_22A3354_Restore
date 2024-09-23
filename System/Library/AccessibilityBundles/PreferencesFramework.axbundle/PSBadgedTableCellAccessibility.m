@implementation PSBadgedTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSBadgedTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)badgeWithInteger:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSBadgedTableCellAccessibility;
  -[PSBadgedTableCellAccessibility badgeWithInteger:](&v6, sel_badgeWithInteger_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSBadgedTableCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("AXBadgeNumber"));

}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PSBadgedTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXBadgeNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  if (v4 < 1)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSBadgedTableCellAccessibility;
    -[PSBadgedTableCellAccessibility accessibilityValue](&v10, sel_accessibilityValue);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("software.update.cell.count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

@end
