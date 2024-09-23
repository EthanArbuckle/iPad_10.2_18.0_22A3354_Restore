@implementation ShortcutsRowTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShortcutsRowTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("ShortcutsRowTableViewCell"), CFSTR("_collectionView"), "UICollectionView");
}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[ShortcutsRowTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ShortcutsRowTableViewCellAccessibility;
    -[ShortcutsRowTableViewCellAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
