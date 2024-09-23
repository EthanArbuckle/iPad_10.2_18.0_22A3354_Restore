@implementation PXPeopleCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXPeopleCollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXPeopleCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewController"), CFSTR("mode"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewController"), CFSTR("setMode:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewController"), CFSTR("collectionView: cellForItemAtIndexPath:"), "@", "@", 0);

}

- (void)_accessibilityModifyCellMode:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  MEMORY[0x2348C1678](CFSTR("PXPeopleCollectionViewCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v5;
    objc_msgSend(v4, "setAXPeopleHomeCellSelectionMode:", -[PXPeopleCollectionViewControllerAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("mode")));

  }
}

- (void)_accessibilityUpdateVisibleCells
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_opt_class();
  -[PXPeopleCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[PXPeopleCollectionViewControllerAccessibility _accessibilityModifyCellMode:](self, "_accessibilityModifyCellMode:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeopleCollectionViewControllerAccessibility;
  -[PXPeopleCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PXPeopleCollectionViewControllerAccessibility _accessibilityUpdateVisibleCells](self, "_accessibilityUpdateVisibleCells");
}

- (void)setMode:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewControllerAccessibility;
  -[PXPeopleCollectionViewControllerAccessibility setMode:](&v4, sel_setMode_, a3);
  -[PXPeopleCollectionViewControllerAccessibility _accessibilityUpdateVisibleCells](self, "_accessibilityUpdateVisibleCells");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPeopleCollectionViewControllerAccessibility;
  -[PXPeopleCollectionViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v7, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewControllerAccessibility _accessibilityModifyCellMode:](self, "_accessibilityModifyCellMode:", v5);
  return v5;
}

@end
