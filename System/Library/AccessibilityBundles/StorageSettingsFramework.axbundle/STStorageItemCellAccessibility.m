@implementation STStorageItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageItemCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageItemCell"), CFSTR("_infoLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageItemCell"), CFSTR("_size"), "q");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[STStorageItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_infoLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageItemCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_size"));
  AXFormatByteSize();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
