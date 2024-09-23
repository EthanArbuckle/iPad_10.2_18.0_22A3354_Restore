@implementation PSReversedSubtitleDisclosureTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSReversedSubtitleDisclosureTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCellSelf
{
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSReversedSubtitleDisclosureTableCellAccessibility _axCellSelf](self, "_axCellSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  -[PSReversedSubtitleDisclosureTableCellAccessibility _axCellSelf](self, "_axCellSelf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
