@implementation COSPairedDeviceListTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSPairedDeviceListTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSPairedDeviceListTableCell"), CFSTR("_watchName"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSPairedDeviceListTableCell"), CFSTR("_watchMaterial"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSPairedDeviceListTableCell"), CFSTR("_watchSize"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSPairedDeviceListTableCell"), CFSTR("_checkmark"), "COSPairedDeviceListCheckmark");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTableCell"), CFSTR("_checked"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSPairedDeviceListTableCell"), CFSTR("checkmark"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[COSPairedDeviceListTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_watchName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSPairedDeviceListTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_watchMaterial"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COSPairedDeviceListTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_watchSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[COSPairedDeviceListTableCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("PairedWatch: [%@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[COSPairedDeviceListTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("checkmark"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityActivationPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)COSPairedDeviceListTableCellAccessibility;
  v3 = -[COSPairedDeviceListTableCellAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  if (-[COSPairedDeviceListTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_checked")))
  {
    objc_opt_class();
    -[COSPairedDeviceListTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkmark"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "isHidden");
    v7 = *MEMORY[0x24BDF7400];
    if (v6)
      v7 = 0;
    v3 |= v7;
  }
  return v3;
}

@end
