@implementation STStorageTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTableCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTableCell"), CFSTR("_infoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageTableCell"), CFSTR("_sizeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStorageTableCell"), CFSTR("infoHidden"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;

  -[STStorageTableCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel, _sizeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STStorageTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("infoHidden")))
  {
    -[STStorageTableCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_infoLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

@end
