@implementation STStorageHeaderLabelCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STStorageHeaderLabelCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("STStorageHeaderLabelCell"), CFSTR("_titleLabel"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[STStorageHeaderLabelCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
