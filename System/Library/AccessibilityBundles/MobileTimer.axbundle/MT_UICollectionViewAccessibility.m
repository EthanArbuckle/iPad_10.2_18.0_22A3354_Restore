@implementation MT_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("moveItemAtIndexPath: toIndexPath:"), "v", "@", "@", 0);

}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MT_UICollectionViewAccessibility;
  -[MT_UICollectionViewAccessibility moveItemAtIndexPath:toIndexPath:](&v12, sel_moveItemAtIndexPath_toIndexPath_, v6, v7);
  -[MT_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AXMTWorldClockCollectionView"));

  if (v9)
  {
    objc_opt_class();
    -[MT_UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsSafeCategory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "movedItemAtIndexPath:toIndexPath:", v6, v7);
  }

}

@end
